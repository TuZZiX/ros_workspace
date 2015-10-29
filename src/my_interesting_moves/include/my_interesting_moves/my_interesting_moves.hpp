//
//  my_interesting_moves_node.hpp
//  ROS
//
//  Created by Shipei Tian on 10/22/15.
//  Copyright © 2015 Shipei. All rights reserved.
//

#ifndef MY_INTERESTING_MOVES_NODE_HPP
#define MY_INTERESTING_MOVES_NODE_HPP

#include <baxter_traj_streamer/baxter_traj_streamer.h>
#include <actionlib/client/simple_action_client.h>
#include <baxter_traj_streamer/trajAction.h>


class Baxter_right_arm
{
public:
	bool enable_pose_limit = false;		//make this true will force limit check for every pose to move and restrict if out of limit
	///  class constructor, create and connect to the action client to send trajectory commander
	Baxter_right_arm(ros::NodeHandle* nodehandle)
	{
		bool server_exists;
		// because the action client and traj steamer need to be initalize with parameter, so it could not done outside function
		// so I initalize it in constructor, and use a pointer get it out.
		static actionlib::SimpleActionClient<baxter_traj_streamer::trajAction> action_client("trajActionServer", true);
		static Baxter_traj_streamer baxter_traj_streamer(nodehandle);
		traj_streamer = &baxter_traj_streamer;
		as_ = &action_client;
		
		g_cnt = 0;
		ROS_INFO("Baxter_right_arm: waiting for server: ");
		while (ros::ok())
		{	//keep trying when failed
			server_exists = action_client.waitForServer(ros::Duration(5.0));	// wait for up to 5 seconds
			if (server_exists)	//if connected
				break;
			ROS_WARN("Baxter_right_arm: Could not connect to trajectory_commander, retrying...");	//if not connected
		}
		ROS_INFO("Baxter_right_arm: connected to action server");
		ROS_INFO("Baxter_right_arm: warming up callbacks...");
		for (int i = 0; i < 100; i++) {
			ros::spinOnce();
			ros::Duration(0.01).sleep();
		}
	}
	///  move right arm to a certain pose, waiting for finish
	///  matrix overload version
	///
	///  @param joint_pose input: the pose to reach
	void move(Vectorq7x1 joint_pose)
	{
		add_movement(joint_pose);	//add to move sequence
		start_move();				//start moving
		wait_for_finish();			//and wait
	}
	///  move right arm to a certain pose, waiting for finish
	///  array overload version
	///
	///  @param joint_pose input: the pose to reach
	void move(const double joint_pose[])
	{
		add_movement(joint_pose);	//add to move sequence
		start_move();				//start moving
		wait_for_finish();			//and wait
	}
	///  add a pose to the movement sequence, once start moving, the arm will move over every pose in the sequence with respect of order
	///  you need to call start_move and wait_for_finish to apply the poses
	///  matrix overload version
	///
	///  @param joint_pose input: the next pose to add to the movement sequence
	void add_movement(Vectorq7x1 joint_pose)
	{
		ROS_INFO("Baxter_right_arm: pose [%f, %f, %f, %f, %f, %f, %f] added to the sequence", 
			joint_pose[0], joint_pose[1], joint_pose[2], joint_pose[3], 
			joint_pose[4], joint_pose[5], joint_pose[6]);		//display the pose
		check_limit(joint_pose);				//restrict if out of limit
		ros::spinOnce();						//wait for feedback callback, so that the current arm pose will be updated
		if (first_cmd == true)					//if this is the first pose in the sequence, add the current pose of arm before it
		{
			q_vec_right_arm = (*traj_streamer).get_qvec_right_arm();	//get current arm pose
			q_in_vecxd = q_vec_right_arm;								//convert to Eigen Vector
			des_path.push_back(q_vec_right_arm);						//makes it the first pose
			first_cmd = false;											//so this work won't be done next time
		}
		q_in_vecxd = joint_pose;			//convert to Eigen Vector
		des_path.push_back(joint_pose);		//add customed trajectory to sequence
	}
	///  add a pose to the movement sequence, once start moving, the arm will move over every pose in the sequence with respect of order
	///  you need to call start_move and wait_for_finish to apply the poses
	///  array overload version
	///
	///  @param joint_pose input: the next pose to add to the move sequence
	void add_movement(const double joint_pose[])
	{
		Vectorq7x1 pose;				//construct a matrix
		for (int i = 0; i < 7; i++) {
			pose[i] = joint_pose[i];	//copy numbers in array to matrix
		}
		add_movement(pose);				//call matrix version to execute
	}
	///  stop the unfinishded movement, and start moving arm to the pose in current sequence
	///  move sequence will be cleared once called
	void start_move()
	{
		(*as_).cancelGoal();			//if there is a unfinished goal, stop it
		(*traj_streamer).stuff_trajectory(des_path, joint_traj); //convert from vector of 7dof poses to trajectory message
		des_path.clear();				//clear the sequence
		first_cmd = true;				//also clear the flag
		goal_.trajectory = joint_traj;	//fill the goal
		goal_.traj_id = g_cnt++;		//also increase the goal count
		(*as_).sendGoal(goal_);			//sent goal to interpolator_as to start moving
		while (check_as_state().compare("ACTIVE") != 0);	//make sure the goal have been accepted
		ROS_INFO("Baxter_right_arm: goal number %d accepted", g_cnt);
	}
///  stop current movement
	void stop_move()
	{
		(*as_).cancelGoal();			//tell action server the goal have been canceled
		ROS_INFO("Baxter_right_arm: goal number %d cancelled", g_cnt);
	}
	///  check current action server state
	///  state list:
	///  PENDING
	///  ACTIVE
	///  RECALLED
	///  REJECTED
	///  PREEMPTED
	///  ABORTED
	///  SUCCEEDED
	///  LOST
	///
	///  @return string of current action server state, compare it with state above
	std::string check_as_state()
	{
		return ((*as_).getState()).toString();	//return the string of action server state
	}
	///  wait for the current movement to finish in a certain time
	///
	///  @param input: the time (in second) to wait, 0 = unlimited time, default is 0
	///
	///  @return is movement finish on time
	bool wait_for_finish(double timeout = 0.0)
	{
		if (timeout <= 0.0)				//for infinite time
		{
			(*as_).waitForResult();
		}
		else
		{
			bool finished_before_timeout = (*as_).waitForResult(ros::Duration(timeout));	//wait before timeout
			if (!finished_before_timeout) {
				ROS_WARN("Baxter_right_arm: giving up waiting on result for goal number %d", g_cnt);
				return false;			//did not finished on time
			}
		}
		ROS_INFO("Baxter_right_arm: goal number %d finished before timeout", g_cnt);
		return true;					//finished
	}
	///  move hand to front and start waving  hand
	///
	///  @param times input: how many times you want to wave, default is 1
	void wave_hand(int times = 1)
	{
		for (int i = 0; i < times; i++)
		{
			move(wave_pose_right[1]);	//middle
			move(wave_pose_right[2]);	//right
			move(wave_pose_right[1]);	//middle
			move(wave_pose_right[0]);	//left
			move(wave_pose_right[1]);	//middle
		}
	}
	///  let robot to push the beer off the table
	void push_beer()
	{
		move(push_pose_right[0]);		//send pose sequence
		move(push_pose_right[1]);
		move(push_pose_right[2]);
	}
	///  get arm above the table, so it will not stuck especially at inital pose
	void move_above_table()
	{
		move(table_pose_right[0]);		//send pose sequence
		move(table_pose_right[1]);
	}
private:
	const double wave_pose_right[3][7] = {		//pose sequence for wave hand
		{0.5, 0, 0, 0, 0.5, -1.74, 0},
		{0.5, 0, 0, 0, 0, -1.74, 0},
		{0.5, 0, 0, 0, -0.5, -1.74, 0}
	};
	const double push_pose_right[3][7] = {		//pose sequence for push the beer
		{0.7, 0.2, 0.4, 0.7, -0.3, -0.7, 0},
		{1.0, 0.2, 0.4, 0.7, -0.3, -0.7, 0},
		{1.3, 0.2, 0.4, 0.7, -0.3, -0.7, 0}
	};
	const double table_pose_right[2][7] = {		//pose sequence for get hand on table
		{-0.6, 0.6, 0, -0.4, 0, -1, 0},
		{0.5, 0.2, 0, 0.4, 0, -0.7, 0}
	};
	const double pose_limit[2][7] = {			//max angle for each pose
		{M_PI/2, M_PI/4, M_PI/2, M_PI/4, M_PI/2, M_PI/4, M_PI/2,},			//from position in col 1 to position in col 2
		{-M_PI/2, -M_PI/4, -M_PI/2, -M_PI/6, -M_PI/2, -M_PI/4, -M_PI/2,}
	};
	
	actionlib::SimpleActionClient<baxter_traj_streamer::trajAction> *as_;	//point to action client
	baxter_traj_streamer::trajGoal goal_;									//goal of interpolator_as
	trajectory_msgs::JointTrajectory joint_traj;							//trajectory form of arm pose
	Baxter_traj_streamer *traj_streamer;									//point to traj streamer
	int g_cnt;																//goal counter
	bool first_cmd = true;													//first pose flag
	Eigen::VectorXd q_in_vecxd;												//use to convert value to vector
	Vectorq7x1 q_vec_right_arm;												//use to store current arm pose
	std::vector<Eigen::VectorXd> des_path;									//pose sequence
	
	///  check angle of each pose, make sure no angle is out of limitation
	///  if the angle is out of limit, it will be adjust to the max possible value
	///
	///  @param input&output: joint_pose the pose to check
	///
	///  @return is any angle out of limit
	bool check_limit(Vectorq7x1 &joint_pose)
	{
		bool all_correct = true;											//is no angle out of limit?
		if (enable_pose_limit == true)
		{
			for (int i = 0; i < 7; i++)
			{
				if (joint_pose[i] > pose_limit[0][i])						//check upper limit
				{
					joint_pose[i] = pose_limit[0][i];						//adjust the angle
					ROS_WARN("joint_pose[i] is above upper limit");
					all_correct = false;
				}
				if (joint_pose[i] < pose_limit[1][i])						//check lower limit
				{
					joint_pose[i] = pose_limit[1][i];
					ROS_WARN("joint_pose[i] is below lower limit");
					all_correct = false;
				}
			}
			ROS_INFO("Baxter_right_arm: pose after adjust: [%f, %f, %f, %f, %f, %f, %f]", 
			joint_pose[0], joint_pose[1], joint_pose[2], joint_pose[3], 
			joint_pose[4], joint_pose[5], joint_pose[6]);
		}
		return all_correct;
	}

};

#endif /* my_interesting_moves_node_hpp */

