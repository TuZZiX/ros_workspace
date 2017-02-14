//
// Created by tianshipei on 2/14/16.
//

#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <mobot_simulation/pathAction.h>
#include <mobot_simulation/mobot_general.h>
#include <nav_msgs/Odometry.h>


const double STEP_LENGTH = 0.1;
const double MOVE_DISTANCE = 0.5;
const double BACK_WALL_DISTANCE = 0.2;

double adjust_time = 0.1; //specify a sample period of 100ms
bool g_lidar_alarm = false; // global var for lidar alarm
bool is_init_orien = false;
double opt_dir = 0;
double orientation = 0;
geometry_msgs::Pose g_current_pose;

void doneCb(const actionlib::SimpleClientGoalState& gstate, const mobot_simulation::pathResultConstPtr& result) {
    ROS_INFO("goal finished with state [%s]", gstate.toString().c_str());
    std::vector<double> euler_r;
    //g_current_pose = result->final.pose;
    euler_r = quat2euler(result->final.pose.orientation);
    orientation = euler_r[2];
    ROS_INFO("Position: %f, %f, %f", result->final.pose.position.x,
             result->final.pose.position.y, result->final.pose.position.z);
    ROS_INFO("Direction: %f degree, step[%d]", orientation, result->final.header.seq);
    //call when action terminated
}
void activeCb() {
    //call when action start (executeCb been called)
    ROS_INFO("Start executing goal");
}
void feedbackCb(const mobot_simulation::pathFeedbackConstPtr& feedback) {
    std::vector<double> euler_r;
    //g_current_pose = feedback->current.pose;
    euler_r = quat2euler(feedback->current.pose.orientation);
    orientation = euler_r[2];
	ROS_INFO("Current position: %f, %f, %f, step[%d]", feedback->current.pose.position.x,
             feedback->current.pose.position.y, feedback->current.pose.position.z, feedback->current.header.seq);
    ROS_INFO("Current direction: %f degree, step[%d]", orientation, feedback->current.header.seq);
}
void alarmCallback(const std_msgs::Bool& alarm_msg)
{
    g_lidar_alarm = alarm_msg.data; //make the alarm status global, so main() can use it
}
void directionCallback(const std_msgs::Float64& direction_msg) {
    opt_dir = direction_msg.data;
}
// get start orientation
void odomCallback(const nav_msgs::Odometry& odom_msg) {
    if (!is_init_orien) {
        is_init_orien = true;
        g_current_pose = odom_msg.pose.pose;
    }
    g_current_pose = odom_msg.pose.pose;
}
//node to send Twist commands to the Simple 2-Dimensional Robot Simulator via cmd_vel
int main(int argc, char **argv) {
    bool server_exists, finished;
    //bool goback = false;
    double turn_ang = 0.0;
    int seq = 1;
    geometry_msgs::PoseStamped next_pose;
    ros::init(argc, argv, "mobot_client");
    ros::NodeHandle n; // two lines to create a publisher object that can talk to ROS
    ros::Subscriber alarm_subscriber = n.subscribe("lidar_alarm",1,alarmCallback);
    ros::Subscriber direction_subscriber = n.subscribe("opt_direction", 1, directionCallback);
    ros::Subscriber odem_subscriber = n.subscribe("odom", 1, odomCallback);
    actionlib::SimpleActionClient<mobot_simulation::pathAction> commandAct("path_action", true);	//create action
    mobot_simulation::pathGoal goal;	//create message for action_commander

    while (!is_init_orien) {
        ros::spinOnce();    //get initial pose
    }

    ROS_INFO("Waiting for action_commander for 5s...");
    while (ros::ok()) {	//keep trying when failed
        server_exists = commandAct.waitForServer(ros::Duration(5.0));	// wait for up to 5 seconds
        if (server_exists)	//if connected
            break;
        ROS_WARN("Could not connect to action_commander, retrying..);	//if not connected
    }
    goal.target.header.frame_id = "mobot_client";

    while(ros::ok()) { // do forever
        if (finished) {
            ROS_INFO("Current goal finished");
            goal.target.poses.clear();
            goal.target.header.seq = seq++;
            goal.target.header.stamp = ros::Time::now();
            if (g_lidar_alarm) {
                ROS_WARN("Back from wall");
                /*
                while (opt_dir > M_PI/2 || opt_dir < -1*M_PI/2) {
                    opt_dir = opt_dir - M_PI;
                    goback = true;
                }*/
                ros::spinOnce();
                turn_ang = orientation+opt_dir;
                for (double i = 0.0; i < BACK_WALL_DISTANCE; i+=STEP_LENGTH) {
                    next_pose.pose.orientation = ang2quat(turn_ang);/*
                    if (goback) {
                        next_pose.pose.position.x = g_current_pose.position.x - cos(opt_dir)*STEP_LENGTH;
                        next_pose.pose.position.y = g_current_pose.position.y - sin(opt_dir)*STEP_LENGTH;
                    } else {*/
                        next_pose.pose.position.x = g_current_pose.position.x + cos(opt_dir)*STEP_LENGTH;
                        next_pose.pose.position.y = g_current_pose.position.y + sin(opt_dir)*STEP_LENGTH;
                    //ROS_INFO("x increase %f, y increase %f", cos(opt_dir)*STEP_LENGTH, sin(opt_dir)*STEP_LENGTH);
                    //}
                    next_pose.pose.position.z = g_current_pose.position.z;
                    g_current_pose = next_pose.pose;
                    goal.target.poses.push_back(next_pose);
                }
                //goback = false;
                commandAct.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);		//send message to action_commander, this will makes it start running
                g_lidar_alarm = false;
                finished = commandAct.waitForResult();
            } else  {
                goal.target.poses.clear();
                goal.target.header.seq = seq++;
                goal.target.header.stamp = ros::Time::now();
                ros::spinOnce();
                turn_ang = orientation+opt_dir;
                for (double i = 0.0; i < MOVE_DISTANCE; i+=STEP_LENGTH) {
                    next_pose.pose.orientation = ang2quat(turn_ang);
                    next_pose.pose.position.x = g_current_pose.position.x + cos(opt_dir)*STEP_LENGTH;
                    next_pose.pose.position.y = g_current_pose.position.y + sin(opt_dir)*STEP_LENGTH;
                    //ROS_INFO("x increase %f, y increase %f", cos(opt_dir)*STEP_LENGTH, sin(opt_dir)*STEP_LENGTH);
                    next_pose.pose.position.z = g_current_pose.position.z;
                    g_current_pose = next_pose.pose;
                    goal.target.poses.push_back(next_pose);
                }
                commandAct.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);		//send message to action_commander, this will makes it start running
            }
        } else {
            if (g_lidar_alarm) {
                ROS_WARN("Back from wall, cancel current goal");
                commandAct.cancelGoal();		//terminate this action
                goal.target.poses.clear();
                goal.target.header.seq = seq++;
                goal.target.header.stamp = ros::Time::now();/*
                while (opt_dir > M_PI/2 || opt_dir < -1*M_PI/2) {
                    opt_dir = opt_dir - M_PI;
                    goback = true;
                }*/
                ros::spinOnce();
                turn_ang = orientation+opt_dir;
                for (double i = 0.0; i < BACK_WALL_DISTANCE; i+=STEP_LENGTH) {
                    next_pose.pose.orientation = ang2quat(turn_ang);
                    /*if (goback) {
                        next_pose.pose.position.x = g_current_pose.position.x - cos(opt_dir)*STEP_LENGTH;
                        next_pose.pose.position.y = g_current_pose.position.y - sin(opt_dir)*STEP_LENGTH;
                    } else {*/
                        next_pose.pose.position.x = g_current_pose.position.x + cos(opt_dir)*STEP_LENGTH;
                        next_pose.pose.position.y = g_current_pose.position.y + sin(opt_dir)*STEP_LENGTH;
                    //ROS_INFO("x increase %f, y increase %f", cos(opt_dir)*STEP_LENGTH, sin(opt_dir)*STEP_LENGTH);
                    //}
                    next_pose.pose.position.z = g_current_pose.position.z;
                    g_current_pose = next_pose.pose;
                    goal.target.poses.push_back(next_pose);
                }
                //goback = false;
                commandAct.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);		//send message to action_commander, this will makes it start running
                g_lidar_alarm = false;
                finished = commandAct.waitForResult();
            }
        }
        //ROS_INFO("Best direction: %f degree", (opt_dir/M_PI)*180);
        finished = commandAct.waitForResult(ros::Duration(adjust_time));
        ros::spinOnce();
    }
    //done commanding the robot; node runs to completion
}

