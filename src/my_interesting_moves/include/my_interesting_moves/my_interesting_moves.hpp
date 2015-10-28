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
//this #include refers to the new "action" message defined for this package
// the action message can be found in: .../baxter_traj_streamer/action/traj.action
// automated header generation creates multiple headers for message I/O
// these are referred to by the root name (traj) and appended name (Action)
// If you write a new client of the server in this package, you will need to include baxter_traj_streamer in your package.xml,
// and include the header file below
#include<baxter_traj_streamer/trajAction.h>


/// <#Description#>
class Baxter_right_arm
{
public:
///  <#Description#>
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
	///  <#Description#>
	///
	///  @param joint_pose <#joint_pose description#>
	void move(Vectorq7x1 joint_pose)
	{
		add_movement(joint_pose);
		start_move();
		wait_for_finish();
	}
	///  <#Description#>
	///
	///  @param joint_pose <#joint_pose description#>
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
		q_vec_right_arm = (*traj_streamer).get_qvec_right_arm();
		q_in_vecxd = q_vec_right_arm; // start from here;
		des_path.push_back(q_vec_right_arm); //put all zeros here
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
		goal_.trajectory = joint_traj;
		goal_.traj_id = g_cnt;
		g_cnt++;
		(*as_).sendGoal(goal_);
		while (check_state().compare("ACTIVE") != 0);
		ROS_INFO("Baxter_right_arm: goal accepted");
	}
///  <#Description#>
	void stop_move()
	{
		(*as_).cancelGoal();
		ROS_INFO("Baxter_right_arm: goal cancelled");
	}
	///  <#Description#>
	///
	///  @return <#return value description#>
	std::string check_state()
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
		ROS_INFO("Baxter_right_arm: finished before timeout");
		return true;
	}
///  <#Description#>
	void back_to_orignal()
	{
		move(orignal_pose_right);
	}
	///  <#Description#>
	///
	///  @param times <#times description#>
	void wave_hand(int times = 1)
	{
		for (int i = 0; i < times; i++)
		{
			move(wave_pose_right_1);
			move(wave_pose_right_2);
		}
	}
///  <#Description#>
	void push_beer()
	{
		move(push_pose_right_1);
		move(push_pose_right_2);
	}
private:
	///  <#Description#>
	const double wave_pose_right_1[7] = {
		-0.907528, -0.111813,   2.06622,    1.8737,    -1.295,   2.00164,  -2.87179
	};
	const double wave_pose_right_2[7] = {
		-0.907528, -0.111813,   2.06622,    1.8737,    -1.295,   2.00164,  -2.87179
	};
	const double push_pose_right_1[7] = {
		-0.907528, -0.111813,   2.06622,    1.8737,    -1.295,   2.00164,  -2.87179
	};
	const double push_pose_right_2[7] = {
		-0.907528, -0.111813,   2.06622,    1.8737,    -1.295,   2.00164,  -2.87179
	};
	const double orignal_pose_right[7] = {
		0, 0, 0, 0, 0, 0, 0
	};
///  <#Description#>
	actionlib::SimpleActionClient<baxter_traj_streamer::trajAction> *as_;
///  <#Description#>
	baxter_traj_streamer::trajGoal goal_;
///  <#Description#>
	trajectory_msgs::JointTrajectory joint_traj;
///  <#Description#>
	Baxter_traj_streamer *traj_streamer;
///  <#Description#>
	int g_cnt;
///  <#Description#>
	Eigen::VectorXd q_in_vecxd;
///  <#Description#>
	Vectorq7x1 q_vec_right_arm;
///  <#Description#>
	std::vector<Eigen::VectorXd> des_path;
};

#endif /* my_interesting_moves_node_hpp */

