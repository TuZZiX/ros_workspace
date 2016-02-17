//
// Created by tianshipei on 2/14/16.
//

#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>
#include <mobot_simulation/pathAction.h>
#include <mobot_simulation/mobot_general.h>
#include <nav_msgs/Odometry.h>

const double STEP_LENGTH = 0.1;
const double MOVE_DISTANCE = 0.5;
const double BACK_WALL_DISTANCE = 0.2;
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
    ros::spinOnce();
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
    updateOdom();
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
    double npts = goal->distance/STEP_LENGTH;
    double turn_angle;
    double yaw_desired = goal->angle;
    double yaw_current = quat2ang(g_current_pose.orientation); //our current yaw--should use a sensor
    double spin_angle = yaw_desired + yaw_current; // spin this much

    ROS_INFO("received path request with %.1f meters",npts);
    for (int i=0; i<npts; i++) { //visit each subgoal
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
        ROS_INFO("pose %d",i);
        yaw_current = quat2ang(g_current_pose.orientation); //our current yaw--should use a sensor
        turn_angle = spin_angle - yaw_current;
        turn_angle = min_spin(turn_angle);// but what if this angle is > pi?  then go the other way
        robot.turn(turn_angle); // carry out this incremental action
        robot.move(STEP_LENGTH);  // move forward 1m...just for illustration; SHOULD compute this from subgoal pose
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
