//
//  maze_solver.cpp
//  ROS
//
//  Created by Shipei Tian on 1/25/16.
//  Copyright © 2016 Shipei. All rights reserved.
//

#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <math.h>

#define NONE		0
#define FORWARD		1
#define BACKWARD	2
#define RIGHT		3
#define LEFT		4


class RobotCommander {
private:
	ros::NodeHandle nh_;
	ros::Publisher *twist_commander;
	//some "magic numbers"
	const double sample_dt = 0.001;
	const double speed = 1.0; // 1m/s speed command
	const double yaw_rate = 0.5; //0.5 rad/sec yaw rate command
	const double turn_correct = 0.000;
	geometry_msgs::Twist twist_cmd; //this is the message type required to send twist commands to STDR
public:
	RobotCommander(ros::NodeHandle* nodehandle): nh_(*nodehandle)
	{
		static ros::Publisher twist_commander_ = nh_.advertise<geometry_msgs::Twist>("/robot0/cmd_vel", 1);
		twist_commander = &twist_commander_;
	}
	RobotCommander(void) {
	}
	void turn(int direction, double time) {
		double timer=0.0;
		ros::Rate loop_timer(1/sample_dt); //create a ros object from the ros “Rate” class; set 100Hz rate
		
		// start with all zeros in the command message; should be the case by default, but just to be safe..
		twist_cmd.linear.x = 0.0;
		twist_cmd.linear.y = 0.0;
		twist_cmd.linear.z = 0.0;
		twist_cmd.angular.x = 0.0;
		twist_cmd.angular.y = 0.0;
		twist_cmd.angular.z = 0.0;
		switch (direction) {
			case NONE:
				break;
			case LEFT:
				twist_cmd.angular.z = yaw_rate;
				break;
			case RIGHT:
				twist_cmd.angular.z = -1.0 * yaw_rate;
				break;
			default:
				break;
		}
		while(timer<time) {
			(*twist_commander).publish(twist_cmd);
			timer+=sample_dt;
			loop_timer.sleep();
			ros::spinOnce();
		}
		twist_cmd.angular.z=0.0;
		for (int i=0;i<10;i++) {
			(*twist_commander).publish(twist_cmd);
			loop_timer.sleep();
			ros::spinOnce();
		}
		
	}
	void turn(int direction) {
		if (direction == LEFT) {
			turn(LEFT, (M_PI/2)/yaw_rate-turn_correct);
		} else if (direction == RIGHT) {
			turn(RIGHT, (M_PI/2)/yaw_rate-turn_correct);
		} else {
			turn(NONE, 3.0);
		}
	}
	void move(int direction, double time) {

		double timer=0.0;
		ros::Rate loop_timer(1/sample_dt); //create a ros object from the ros “Rate” class; set 100Hz rate
		
		// start with all zeros in the command message; should be the case by default, but just to be safe..
		twist_cmd.linear.x = 0.0;
		twist_cmd.linear.y = 0.0;
		twist_cmd.linear.z = 0.0;
		twist_cmd.angular.x = 0.0;
		twist_cmd.angular.y = 0.0;
		twist_cmd.angular.z = 0.0;
		switch (direction) {
			case NONE:
				break;
			case FORWARD:
				twist_cmd.linear.x = speed;
				break;
			case BACKWARD:
				twist_cmd.linear.x = -1.0 * speed;
				break;
			default:
				break;
		}
		while(timer<time) {
			(*twist_commander).publish(twist_cmd);
			timer+=sample_dt;
			loop_timer.sleep();
			ros::spinOnce();
		}
		twist_cmd.linear.x=0.0;
		for (int i=0;i<10;i++) {
			(*twist_commander).publish(twist_cmd);
			loop_timer.sleep();
			ros::spinOnce();
		}
	}
	void move(double time) {
		if (time >= 0) {
			move(FORWARD, time);
		} else {
			move(BACKWARD, -1 * time);
		}
	}
};


//node to send Twist commands to the Simple 2-Dimensional Robot Simulator via cmd_vel
int main(int argc, char **argv) {
	ros::init(argc, argv, "openloop_solver");
	ros::NodeHandle n; // two lines to create a publisher object that can talk to ROS
	RobotCommander robot(&n);
	
	//start sending some zero-velocity commands, just to warm up communications with STDR
	robot.move(NONE, 3.0);
	
	ROS_INFO("Start Moving");
	
	robot.move(FORWARD, 3.0);
	robot.turn(LEFT);
	robot.move(FORWARD, 3.0);
	robot.turn(RIGHT);
	robot.move(FORWARD, 4.5);
	robot.turn(LEFT);
	robot.move(FORWARD, 2.1);
	robot.turn(LEFT);
	robot.move(FORWARD, 4.5);
	robot.turn(RIGHT);
	robot.move(FORWARD, 7.0);
	robot.turn(LEFT);
	robot.move(FORWARD, 2.3);
	
	ROS_INFO("Goal Reached");
	//done commanding the robot; node runs to completion
	return 0;
}

