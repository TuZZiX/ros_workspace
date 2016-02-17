// example_action_client: 
// wsn, October, 2014

#include<ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include<rh_action_server/actmsgAction.h>
#include <std_msgs/Float32.h> //Including the Float32 class from std_msgs
#include <std_msgs/Bool.h> // boolean message

//callbacks
bool g_lidar_alarm1 = false; // global var for lidar alarm
bool g_lidar_alarm2 = false; // global var for lidar alarm

double delta_angle = 0.0;

void alarmCallback_1(const std_msgs::Bool &alarm_msg1) {
    g_lidar_alarm1 = alarm_msg1.data; //make the alarm status global, so main() can use it
    if (g_lidar_alarm1) {
        ROS_INFO("LIDAR alarm 1 received!");
    }
}

void alarmCallback_2(const std_msgs::Bool &alarm_msg2) {
    g_lidar_alarm2 = alarm_msg2.data; //make the alarm status global, so main() can use it
    if (g_lidar_alarm2) {

        ROS_INFO("LIDAR alarm 2 received!");
    }
}
// This function will be called once when the goal completes
// this is optional, but it is a convenient way to get access to the "result" message sent by the server



void doneCb(const actionlib::SimpleClientGoalState &state,
            const rh_action_server::actmsgResultConstPtr &result) {
    ROS_INFO(" doneCb: server responded with state [%s]", state.toString().c_str());
    ROS_INFO("THe final travel distance is %f", result->travel_dist);
}

void activeCb() {
    ROS_INFO("Goal is active");
}

void feedbackCb(const rh_action_server::actmsgFeedbackConstPtr &feedback) {
    delta_angle += feedback->delta_angles;
    ROS_INFO("Gazebo already turned %f", delta_angle);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "rh_action_client_node"); // name this node
    ros::NodeHandle n; //

    ros::Subscriber alarm_subscriber_1 = n.subscribe("lidar_alarm_1", 1, alarmCallback_1);
    ros::Subscriber alarm_subscriber_2 = n.subscribe("lidar_alarm_2", 1, alarmCallback_2);

    ros::Rate timer(1.0); // 1Hz timer
    // here is a "goal" object compatible with the server, as defined in example_action_server/action
    rh_action_server::actmsgGoal goal;

    // use the name of our server, which is: example_action (named in example_action_server.cpp)
    // the "true" argument says that we want our new client to run as a separate thread (a good idea)
    actionlib::SimpleActionClient<rh_action_server::actmsgAction> action_client("path_action", true);

    // attempt to connect to the server:
    ROS_INFO("waiting for server: ");
    bool server_exists = action_client.waitForServer(ros::Duration(5.0)); // wait for up to 5 seconds
    // something odd in above: does not seem to wait for 5 seconds, but returns rapidly if server not running
    //bool server_exists = action_client.waitForServer(); //wait forever
    if (!server_exists) {
        ROS_WARN("could not connect to server; halting");
        return 0; // bail out; optionally, could print a warning message and retry
    }


    ROS_INFO("connected to action server");  // if here, then we connected to the server;

    while (true) {
        // stuff a goal message:
        goal.input = 1;
        action_client.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);
        // action_client.sendGoal(goal,&doneCb); // we could also name additional callback functions here, if desired
        //action_client.sendGoal(goal, &doneCb, &activeCb, &feedbackCb); //e.g., like this
/*
        while(g_lidar_alarm1){
             goal.input = 11;
             action_client.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);
       }
        while(g_lidar_alarm2){
             goal.input = 12;
             action_client.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);
       }
*/
        if (delta_angle >= 6.28) {   //if angle is more than 2pi, want it to stop
            ROS_INFO("Cancelling goal !");
            action_client.cancelGoal();
        }

/*        
        bool finished_before_timeout = action_client.waitForResult(ros::Duration(5.0));
        //bool finished_before_timeout = action_client.waitForResult(); // wait forever...
        if (!finished_before_timeout) {
        //    ROS_WARN("giving up waiting on result for goal number %d",g_count);
            return 0;
        }
        else {
          //if here, then server returned a result to us
        }
       */
        timer.sleep();
    }

    return 0;
}

