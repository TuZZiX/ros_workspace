//
// Created by tianshipei on 2/14/16.
//

#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>
#include <mobot_simulation/pathAction.h>
#include <mobot_simulation/mobot_general.h>
#include <nav_msgs/Odometry.h>

//global variables, including a publisher object
geometry_msgs::Pose g_current_pose;
bool odom_updated;
// for orientation feedback control
void odomCallback(const nav_msgs::Odometry& odom_msg) {
    g_current_pose = odom_msg.pose.pose;
    odom_updated = true;
}
int updateOdom () {
    odom_updated = false;
    while (!odom_updated) {
        ros::spinOnce();    //get initial pose
    }
}
class PathServer {
private:
    ros::NodeHandle nh_;  // we'll need a node handle; get one upon instantiation

    // this class will own a "SimpleActionServer" called "as_".
    // it will communicate using messages defined in example_action_server/action/demo.action
    // the type "demoAction" is auto-generated from our name "demo" and generic name "Action"
    actionlib::SimpleActionServer<mobot_simulation::pathAction> as_;

    // here are some message types to communicate with our client(s)
    mobot_simulation::pathGoal goal_; // goal message, received from client
    mobot_simulation::pathResult result_; // put results here, to be sent back to the client when done w/ goal
    mobot_simulation::pathFeedback feedback_; // for feedback
    //  use: as_.publishFeedback(feedback_); to send incremental feedback to the client
    RobotCommander robot;
    int seq;

    geometry_msgs::Twist g_twist_cmd;


public:
    PathServer(); //define the body of the constructor outside of class definition

    ~PathServer(void) {
    }
    // Action Interface
    void executeCB(const actionlib::SimpleActionServer<mobot_simulation::pathAction>::GoalConstPtr& goal);
};

//implementation of the constructor:
// member initialization list describes how to initialize member as_
// member as_ will get instantiated with specified node-handle, name by which this server will be known,
//  a pointer to the function to be executed upon receipt of a goal.
//
// Syntax of naming the function to be invoked: get a pointer to the function, called executeCB,
// which is a member method of our class exampleActionServer.
// Since this is a class method, we need to tell boost::bind that it is a class member,
// using the "this" keyword.  the _1 argument says that our executeCB function takes one argument
// The final argument,  "false", says don't start the server yet.  (We'll do this in the constructor)

PathServer::PathServer() :
        as_(nh_, "path_action", boost::bind(&PathServer::executeCB, this, _1),false), robot(&nh_)
// in the above initialization, we name the server "example_action"
//  clients will need to refer to this name to connect with this server
{
    //initialize components of the twist command global variable
    g_twist_cmd.linear.x=0.0;
    g_twist_cmd.linear.y=0.0;
    g_twist_cmd.linear.z=0.0;
    g_twist_cmd.angular.x=0.0;
    g_twist_cmd.angular.y=0.0;
    g_twist_cmd.angular.z=0.0;

    //define initial position to be 0
    g_current_pose.position.x = 0.0;
    g_current_pose.position.y = 0.0;
    g_current_pose.position.z = 0.0;

    // define initial heading to be "0"
    g_current_pose.orientation.x = 0.0;
    g_current_pose.orientation.y = 0.0;
    g_current_pose.orientation.z = 0.0;
    g_current_pose.orientation.w = 1.0;

    seq = 1;

    //start sending some zero-velocity commands, just to warm up communications with STDR
    robot.move(NONE, 3.0);

    as_.start(); //start the server running
    ROS_INFO("Path Server Started!");

    result_.final.header.frame_id = "mobot_server";
    feedback_.current.header.frame_id = "mobot_server";
}

//executeCB implementation: this is a member method that will get registered with the action server
// argument type is very long.  Meaning:
// actionlib is the package for action servers
// SimpleActionServer is a templated class in this package (defined in the "actionlib" ROS package)
// <example_action_server::demoAction> customizes the simple action server to use our own "action" message
// defined in our package, "example_action_server", in the subdirectory "action", called "demo.action"
// The name "demo" is prepended to other message types created automatically during compilation.
// e.g.,  "demoAction" is auto-generated from (our) base name "demo" and generic name "Action"
void PathServer::executeCB(const actionlib::SimpleActionServer<mobot_simulation::pathAction>::GoalConstPtr& goal) {
    //ROS_INFO("Path Server Called");
    double yaw_desired, yaw_current, spin_angle;
    geometry_msgs::Pose pose_desired;
    int npts = goal->target.poses.size();
    double distance = 0.0;
    ROS_INFO("received path request with %d poses",npts);
    for (int i=0;i<npts;i++) { //visit each subgoal
        // each iteration, check if cancellation has been ordered
        if (as_.isPreemptRequested()){
            ROS_WARN("goal cancelled!");
            updateOdom();
            result_.final.pose = g_current_pose;
            result_.final.header.seq = seq++;
            result_.final.header.stamp = ros::Time::now();
            result_.success = false;
            as_.setAborted(result_); // tell the client we have given up on this goal; send the result message as well
            return; // done with callback
        }
        // odd notation: drill down, access vector element, drill some more to get pose
        pose_desired = goal->target.poses[i].pose; //get next pose from vector of poses

        //spin_angle = atan2(pose_desired.position.y - g_current_pose.position.y, pose_desired.position.x - g_current_pose.position.x);
        //robot.turn(spin_angle);
        updateOdom();
        yaw_desired = quat2ang(pose_desired.orientation); //from i'th desired pose
        ROS_WARN("Current position x: %f, y: %f, z:%f", g_current_pose.position.x, g_current_pose.position.y, g_current_pose.position.z);
        //ROS_INFO("Current orientation x: %f, y: %f, z:%f, w:%f", g_current_pose.orientation.x, g_current_pose.orientation.y, g_current_pose.orientation.z, g_current_pose.orientation.w);
        ROS_WARN("Desired position x: %f, y: %f, z:%f", pose_desired.position.x, pose_desired.position.y, pose_desired.position.z);
        //ROS_INFO("Desired orientation x: %f, y: %f, z:%f, w:%f", pose_desired.orientation.x, pose_desired.orientation.y, pose_desired.orientation.z, pose_desired.orientation.w);
        yaw_current = quat2ang(g_current_pose.orientation); //our current yaw--should use a sensor
        spin_angle = yaw_desired - yaw_current; // spin this much
        spin_angle = min_spin(spin_angle);// but what if this angle is > pi?  then go the other way
        ROS_INFO("pose %d: desired spin = %f",i,spin_angle);
        robot.turn(spin_angle); // carry out this incremental action
        double x = g_current_pose.position.x - pose_desired.position.x;
        double y = g_current_pose.position.y - pose_desired.position.y;
        double x2y2 = x*x + y*y;
        distance = sqrt(x2y2);
        ROS_INFO("x: %f, Y: %f, X2Y2: %f", x, y, x2y2);
        //distance = sqrt(pow(g_current_pose.position.x - pose_desired.position.x, 2) + pow(g_current_pose.position.y - pose_desired.position.y, 2));
        ROS_WARN("distance to move %f",distance);
        robot.move(0.1);  // move forward 1m...just for illustration; SHOULD compute this from subgoal pose
        //if here, then goal is still valid; provide some feedback
        updateOdom();
        feedback_.current.pose = g_current_pose;
        feedback_.current.header.seq = seq++;
        feedback_.current.header.stamp = ros::Time::now();
        as_.publishFeedback(feedback_); // send feedback to the action client that requested this goal
    }
    updateOdom();
    //if we survive to here, then the goal was successfully accomplished; inform the client
    result_.final.pose = g_current_pose;
    result_.final.header.seq = seq++;
    result_.final.header.stamp = ros::Time::now();
    result_.success = true;
    as_.setSucceeded(result_); // return the "result" message to client, along with "success" status
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "mobot_server"); // name this node

    ros::NodeHandle n; // two lines to create a publisher object that can talk to ROS
    ros::Subscriber odem_subscriber = n.subscribe("odom", 1, odomCallback);

    ROS_INFO("Initializing mobot_server");
    PathServer server; // create an instance of the class "ExampleActionServer"
    ROS_INFO("Done, waiting for service call");

    // from here, all the work is done in the action server, with the interesting stuff done within "executeCB()"
    // you will see 5 new topics under example_action: cancel, feedback, goal, result, status
    ros::spin();
    return 0;
}
