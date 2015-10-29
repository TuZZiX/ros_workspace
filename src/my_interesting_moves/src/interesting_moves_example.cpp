//
//  interesting_moves_example.cpp
//  ROS
//
//  Created by Shipei Tian on 10/22/15.
//  Copyright © 2015 Shipei. All rights reserved.
//

#include <my_interesting_moves/my_interesting_moves.hpp>

const double sleep_time = 3;							//sleep time before each movement apply
const double my_pose[] = {0, 0, 0, 0, 0, 0, 0};
const double impossible_pose[] = {4, -5, 6, -7, 8, -9, 10};

int main(int argc, char** argv) {
	
	ros::init(argc, argv, "traj_action_client_node");	//name this node
	ros::NodeHandle nh;									//standard ros node handle
	Baxter_right_arm right_arm(&nh);					//create our object

	ROS_WARN("I getting my arm above the table");		//use WARN message because it is more obvious
	ros::Duration(sleep_time).sleep();					//wait for 3 second each time so that you can read the text
	right_arm.move_above_table();						//do the work

	ROS_WARN("I am going to push the beer off the table");
	ros::Duration(sleep_time).sleep();
	right_arm.push_beer();

	ROS_WARN("I am moving to an arbitrary pose [%f, %f, %f, %f, %f, %f, %f]", 
			my_pose[0], my_pose[1], my_pose[2], my_pose[3], 
			my_pose[4], my_pose[5], my_pose[6]);
	ros::Duration(sleep_time).sleep();
	right_arm.move(my_pose);							//this is the normal way of move the arm


	ROS_WARN("I am going to wave my right hand 3 times");
	ros::Duration(sleep_time).sleep();
	right_arm.wave_hand(3);
	
	ROS_WARN("I am moving to an impossible pose with time limit 10 seconds [%f, %f, %f, %f, %f, %f, %f]", 
			impossible_pose[0], impossible_pose[1], impossible_pose[2], impossible_pose[3], 
			impossible_pose[4], impossible_pose[5], impossible_pose[6]);
	ros::Duration(sleep_time).sleep();
	//here is another approach of move the arm
	right_arm.add_movement(impossible_pose);			//add the movement to the sequence
	right_arm.start_move();								//start moving
	if (right_arm.wait_for_finish(10.0) == false)		//wait for finish for 10 seconds
	{
		ROS_WARN("I did not finished on time, I will stop");	//if not finished
		right_arm.stop_move();							//stop moving
	}

	ros::Duration(sleep_time).sleep();
	ROS_WARN("Let's try again, I will move back");
	right_arm.move(my_pose);							//just move to somewhere

	ROS_WARN("I will introduce pose limitation this time");
	right_arm.enable_pose_limit = true;					//enable the pose limit so that the arm won't goes to a weird pose
	ROS_WARN("I am moving to an impossible pose [%f, %f, %f, %f, %f, %f, %f]", 
			impossible_pose[0], impossible_pose[1], impossible_pose[2], impossible_pose[3], 
			impossible_pose[4], impossible_pose[5], impossible_pose[6]);
	ros::Duration(sleep_time).sleep();
	right_arm.move(impossible_pose);					//try the same pose again
	ROS_WARN("Now I have reach the maximum pose");
	
	ros::Duration(sleep_time).sleep();
	ROS_WARN("That is all, thank you");
	right_arm.wave_hand(5);								//I love this motion
	
	return 0;
}

