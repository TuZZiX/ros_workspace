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
	bool enable_pose_limit = false;
	///  class constructor, create and connect to the action client to send trajectory commander
	Baxter_right_arm(ros::NodeHandle* nodehandle)
	{
		bool server_exists;
		static actionlib::SimpleActionClient<baxter_traj_streamer::trajAction> action_client("trajActionServer", true);
		static Baxter_traj_streamer baxter_traj_streamer(nodehandle);
		g_cnt = 0;
		traj_streamer = &baxter_traj_streamer;
		as_ = &action_client;
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
	///
	///  @param joint_pose input:
	void move(Vectorq7x1 joint_pose)
	{
		add_movement(joint_pose);
		start_move();
		wait_for_finish();
	}
	///  move right arm to a certain pose, waiting for finish
	///
	///  @param joint_pose input:
	void move(const double joint_pose[])
	{
		add_movement(joint_pose);
		start_move();
		wait_for_finish();
	}
	///  <#Description#>
	///
	///  @param joint_pose <#joint_pose description#>
	void add_movement(Vectorq7x1 joint_pose)
	{
		ROS_INFO("Baxter_right_arm: pose [%f, %f, %f, %f, %f, %f, %f] added to the sequence", 
			joint_pose[0], joint_pose[1], joint_pose[2], joint_pose[3], 
			joint_pose[4], joint_pose[5], joint_pose[6]);
		check_limit(joint_pose);
		ros::spinOnce();
		if (first_cmd == true)
		{
			q_vec_right_arm = (*traj_streamer).get_qvec_right_arm();
			q_in_vecxd = q_vec_right_arm; // start from here;
			des_path.push_back(q_vec_right_arm); //put all zeros here
			first_cmd = false;
		}
		q_in_vecxd = joint_pose; // conversion; not sure why I needed to do this...but des_path.push_back(q_in_vecxd) likes it
		des_path.push_back(joint_pose); //twice, to define a trajectory
	}
	///  <#Description#>
	///
	///  @param joint_pose <#joint_pose description#>
	void add_movement(const double joint_pose[])
	{
		Vectorq7x1 pose;
		for (int i = 0; i < 7; i++) { //pre-size these vectors, so can access w/ indices
			pose[i] = joint_pose[i];
		}
		add_movement(pose);
	}
///  <#Description#>
	void start_move()
	{
		(*traj_streamer).stuff_trajectory(des_path, joint_traj); //convert from vector of 7dof poses to trajectory message
		des_path.clear();
		first_cmd = true;
		goal_.trajectory = joint_traj;
		goal_.traj_id = g_cnt;
		g_cnt++;
		(*as_).sendGoal(goal_);
		while (check_as_state().compare("ACTIVE") != 0);
		ROS_INFO("Baxter_right_arm: goal number %d accepted", g_cnt);
	}
///  <#Description#>
	void stop_move()
	{
		(*as_).cancelGoal();
		ROS_INFO("Baxter_right_arm: goal number %d cancelled", g_cnt);
	}
	///  <#Description#>
	///
	///  @return <#return value description#>
	std::string check_as_state()
	{
		return ((*as_).getState()).toString();
	}
	///  <#Description#>
	///
	///  @param .0 <#.0 description#>
	///
	///  @return <#return value description#>
	bool wait_for_finish(double timeout = 0.0)
	{
		if (timeout <= 0.0)
		{
			(*as_).waitForResult();
		}
		else
		{
			bool finished_before_timeout = (*as_).waitForResult(ros::Duration(timeout));
			if (!finished_before_timeout) {
				ROS_WARN("Baxter_right_arm: giving up waiting on result for goal number %d", g_cnt);
				return false;
			}
		}
		ROS_INFO("Baxter_right_arm: goal number %d finished before timeout", g_cnt);
		return true;
	}
	///  <#Description#>
	///
	///  @param times <#times description#>
	void wave_hand(int times = 1)
	{
		for (int i = 0; i < times; i++)
		{
			move(wave_pose_right[1]);
			move(wave_pose_right[2]);
			move(wave_pose_right[1]);
			move(wave_pose_right[0]);
			move(wave_pose_right[1]);
		}
	}
	void push_beer()
	{
		move(push_pose_right[0]);
		move(push_pose_right[1]);
		move(push_pose_right[2]);
	}
	void move_above_table()
	{
		move(table_pose_right[0]);
		move(table_pose_right[1]);
	}
private:
	const double wave_pose_right[3][7] = {
		{0.5, 0, 0, 0, 0.5, -1.74, 0},
		{0.5, 0, 0, 0, 0, -1.74, 0},
		{0.5, 0, 0, 0, -0.5, -1.74, 0}
	};
	const double push_pose_right[3][7] = {
		{0.7, 0.2, 0.4, 0.7, -0.3, -0.7, 0},
		{1.0, 0.2, 0.4, 0.7, -0.3, -0.7, 0},
		{1.3, 0.2, 0.4, 0.7, -0.3, -0.7, 0}
	};
	const double table_pose_right[2][7] = {
		{-0.6, 0.6, 0, -0.4, 0, -1, 0},
		{0.5, 0.2, 0, 0.4, 0, -0.7, 0}
	};
	const double pose_limit[2][7] = {
		{M_PI/2, M_PI/4, M_PI/2, M_PI/4, M_PI/2, M_PI/4, M_PI/2,},			//from position in col 1 to position in col 2
		{-M_PI/2, -M_PI/4, -M_PI/2, -M_PI/6, -M_PI/2, -M_PI/4, -M_PI/2,}
	};
	actionlib::SimpleActionClient<baxter_traj_streamer::trajAction> *as_;
	baxter_traj_streamer::trajGoal goal_;
	trajectory_msgs::JointTrajectory joint_traj;
	Baxter_traj_streamer *traj_streamer;
	int g_cnt;
	bool first_cmd = true;
	Eigen::VectorXd q_in_vecxd;
	Vectorq7x1 q_vec_right_arm;
	std::vector<Eigen::VectorXd> des_path;
	
	bool check_limit(Vectorq7x1 &joint_pose)
	{
		bool all_correct = true;
		if (enable_pose_limit == true)
		{
			for (int i = 0; i < 7; i++)
			{
				if (joint_pose[i] > pose_limit[0][i])
				{
					joint_pose[i] = pose_limit[0][i];
					ROS_WARN("joint_pose[i] is above upper limit");
					all_correct = false;
				}
				if (joint_pose[i] < pose_limit[1][i])
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
	}

};

#endif /* my_interesting_moves_node_hpp */

