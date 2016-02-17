// example_action_server: 2nd version, includes "cancel" and "feedback"
// expects client to give an integer corresponding to a timer count, in seconds
// server counts up to this value, provides feedback, and can be cancelled any time
// re-use the existing action message, although not all fields are needed
// use request "input" field for timer setting input, 
// value of "fdbk" will be set to the current time (count-down value)
// "output" field will contain the final value when the server completes the goal request

#include<ros/ros.h>
#include <actionlib/server/simple_action_server.h>
//the following #include refers to the "action" message defined for this package
// The action message can be found in: .../example_action_server/action/demo.action
// Automated header generation creates multiple headers for message I/O
// These are referred to by the root name (demo) and appended name (Action)
#include<rh_action_server/actmsgAction.h>
#include <geometry_msgs/Twist.h>
#include <std_msgs/Bool.h> // boolean message

//ros::Publisher twist_commander;



class RhActionServer {
private:
    ros::NodeHandle nh_;
  // we'll need a node handle; get one upon instantiation
    // this class will own a "SimpleActionServer" called "as_".
    // it will communicate using messages defined in example_action_server/action/demo.action
    // the type "demoAction" is auto-generated from our name "demo" and generic name "Action"
    actionlib::SimpleActionServer<rh_action_server::actmsgAction> as_;
    
    // here are some message types to communicate with our client(s)
  //  example_action_server::demoGoal goal_; // goal message, received from client
    rh_action_server::actmsgResult result_; // put results here, to be sent back to the client when done w/ goal
    rh_action_server::actmsgFeedback feedback_; // for feedback 
    //  use: as_.publishFeedback(feedback_); to send incremental feedback to the client



public:
    RhActionServer(); //define the body of the constructor outside of class definition

    ~RhActionServer(void) {
    }
    // Action Interface
    void executeCallback(const actionlib::SimpleActionServer<rh_action_server::actmsgAction>::GoalConstPtr& goal); 
    int goal_receive;
    double sample_dt; //specify a sample period of 10ms  
    double speed; // 1m/s speed command
    double low_speed;
    double yaw_rate; //0.5 rad/sec yaw rate command
    double time_3_sec; // should move 3 meters or 1.5 rad in 3 seconds
    double distance;
    geometry_msgs::Twist twist_cmd; //


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

RhActionServer::RhActionServer() :
   as_(nh_, "path_action", boost::bind(&RhActionServer::executeCallback, this, _1),false) 
// in the above initialization, we name the server "example_action"
//  clients will need to refer to this name to connect with this server
{
    ROS_INFO("in constructor of RhActionServer...");
    // do any other desired initializations here...specific to your implementation
    goal_receive = 0;
    sample_dt = 0.01; //specify a sample period of 10ms  
    speed = 1.0; // 1m/s speed command
    low_speed = 0.5;
    yaw_rate = 0.5; //0.5 rad/sec yaw rate command
    time_3_sec = 3.14; // should move 3 meters or 1.5 rad in 3 seconds

    distance = 0.0;

    twist_cmd.linear.x=0.0;
    twist_cmd.linear.y=0.0;    
    twist_cmd.linear.z=0.0;
    twist_cmd.angular.x=0.0;
    twist_cmd.angular.y=0.0;
    twist_cmd.angular.z=0.0; 

    as_.start(); //start the server running
}

//executeCB implementation: this is a member method that will get registered with the action server
// argument type is very long.  Meaning:
// actionlib is the package for action servers
// SimpleActionServer is a templated class in this package (defined in the "actionlib" ROS package)
// <example_action_server::demoAction> customizes the simple action server to use our own "action" message 
// defined in our package, "example_action_server", in the subdirectory "action", called "demo.action"
// The name "demo" is prepended to other message types created automatically during compilation.
// e.g.,  "demoAction" is auto-generated from (our) base name "demo" and generic name "Action"
void RhActionServer::executeCallback(
        const actionlib::SimpleActionServer<rh_action_server::actmsgAction>::GoalConstPtr &goal) {

    ros::Rate loop_timer(1 / sample_dt); //create a ros object from the ros “Rate” class; set 100Hz rate
    double timer = 0.0;

    ros::Publisher twist_commander = nh_.advertise<geometry_msgs::Twist>("/cmd_vel", 1);

    ROS_INFO("in executeCallback");
    ROS_INFO("goal input is: %d", goal->input);  ///cannot get here
    goal_receive = goal->input;

    for (int i = 0; i < 10; i++) {
        twist_commander.publish(twist_cmd);
        ros::spinOnce();
        loop_timer.sleep();
    }

    //do work here: this is where your interesting code goes
    while (goal_receive == 1) {                ///want this to be the no obstacles situation
        twist_cmd.angular.z = 0.0; // do not spin
        twist_cmd.linear.x = speed; //command to move forward
        timer = 0.0;
        while (timer < 2 * time_3_sec) {
            twist_commander.publish(twist_cmd);
            timer += sample_dt;
            ros::spinOnce();
            loop_timer.sleep();
        }

        distance += speed * timer;

        feedback_.delta_angles = yaw_rate * timer;
        as_.publishFeedback(feedback_);

        twist_cmd.angular.z = -yaw_rate; //
        twist_cmd.linear.x = 0.0;
        timer = 0.0;
        while (timer < time_3_sec) {
            twist_commander.publish(twist_cmd);
            timer += sample_dt;
            ros::spinOnce();
            loop_timer.sleep();
        }

        feedback_.delta_angles = yaw_rate * timer;
        as_.publishFeedback(feedback_);

    }

    while (goal_receive == 11) {
        twist_cmd.angular.z = yaw_rate; //
        twist_cmd.linear.x = 0.0;
        timer = 0.0;
        while (timer < time_3_sec) {
            twist_commander.publish(twist_cmd);
            timer += sample_dt;
            ros::spinOnce();
            loop_timer.sleep();
        }
        feedback_.delta_angles = yaw_rate * timer;
        as_.publishFeedback(feedback_);
    }

    while (goal_receive == 12) {
        twist_cmd.angular.z = yaw_rate; //
        twist_cmd.linear.x = 0.0;
        timer = 0.0;
        while (timer < time_3_sec) {
            twist_commander.publish(twist_cmd);
            timer += sample_dt;
            ros::spinOnce();
            loop_timer.sleep();
        }
        feedback_.delta_angles = yaw_rate * timer;
        as_.publishFeedback(feedback_);
    }

    /*
          if (as_.isPreemptRequested()){	 //check if cancelled,do not want to cancel during alarm
             ROS_WARN("goal cancelled!");
             result_.travel_dist = distance;
             as_.setAborted(result_); // tell the client we have given up on this goal; send the result message as well
             return; // done with callback
             }
   */

}

int main(int argc, char** argv) {
    ros::init(argc, argv, "rh_action_server_node"); // name this node 

    RhActionServer as_object; // create an instance of the class "ExampleActionServer"
     
    ROS_INFO("going into spin");
    // from here, all the work is done in the action server, with the interesting stuff done within "executeCB()"
    // you will see 5 new topics under example_action: cancel, feedback, goal, result, status
    ros::spin();  //spin and spinonce use together

    return 0;
}

