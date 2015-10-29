//
//  interesting_moves_example.cpp
//  ROS
//
//  Created by Shipei Tian on 10/22/15.
//  Copyright © 2015 Shipei. All rights reserved.
//

#include <my_interesting_moves/my_interesting_moves.hpp>

const double sleep_time = 3;

int main(int argc, char** argv) {
	double my_pose[] = {0, 0, 0, 0, 0, 0, 0};
	double impossible_pose[] = {4, -5, 6, -7, 8, -9, 10};
	unsigned int angle = 0;
	double amount;
	ros::init(argc, argv, "traj_action_client_node"); // name this node
	ros::NodeHandle nh; //standard ros node handle
	Baxter_right_arm right_arm(&nh);

	ROS_WARN("I getting my arm above the table");
	ros::Duration(sleep_time).sleep();
	right_arm.move_above_table();

	ROS_WARN("I am going to push the beer off the table");
	ros::Duration(sleep_time).sleep();
	right_arm.push_beer();

	ROS_WARN("I am moving to an arbitrary pose [%f, %f, %f, %f, %f, %f, %f]", 
			my_pose[0], my_pose[1], my_pose[2], my_pose[3], 
			my_pose[4], my_pose[5], my_pose[6]);
	ros::Duration(sleep_time).sleep();
	right_arm.move(my_pose);


	ROS_WARN("I am going to wave my right hand 3 times");
	ros::Duration(sleep_time).sleep();
	right_arm.wave_hand(3);
	
	ROS_WARN("I am moving to an impossible pose with time limit 10 seconds [%f, %f, %f, %f, %f, %f, %f]", 
			impossible_pose[0], impossible_pose[1], impossible_pose[2], impossible_pose[3], 
			impossible_pose[4], impossible_pose[5], impossible_pose[6]);
	ros::Duration(sleep_time).sleep();
	right_arm.add_movement(impossible_pose);
	right_arm.start_move();
	if (right_arm.wait_for_finish(10.0) == false)
	{
		ROS_WARN("I did not finished on time, I will stop");
		right_arm.stop_move();
	}

	ros::Duration(sleep_time).sleep();
	ROS_WARN("Let's try again, I will move back");
	right_arm.move(my_pose);

	ROS_WARN("I will introduce pose limitation this time");
	right_arm.enable_pose_limit = true;
	ROS_WARN("I am moving to an impossible pose [%f, %f, %f, %f, %f, %f, %f]", 
			impossible_pose[0], impossible_pose[1], impossible_pose[2], impossible_pose[3], 
			impossible_pose[4], impossible_pose[5], impossible_pose[6]);
	ros::Duration(2).sleep();
	right_arm.move(impossible_pose);
	return 0;
}

