//
//  interesting_moves_example.cpp
//  ROS
//
//  Created by Shipei Tian on 10/22/15.
//  Copyright © 2015 Shipei. All rights reserved.
//

#include <my_interesting_moves/my_interesting_moves.hpp>


int main(int argc, char** argv) {
	double my_pose[] = {-0.907528, -0.111813, 2.06622, 1.8737, -1.295, 2.00164, -2.87179};
	ros::init(argc, argv, "traj_action_client_node"); // name this node
	ros::NodeHandle nh; //standard ros node handle
	Baxter_right_arm right_arm(&nh);
	ROS_INFO("I am moving to all zero point");
	right_arm.back_to_orignal();
	ROS_INFO("I am going to push the beer");
	right_arm.push_beer();
	ROS_INFO("I am going to somewhere");
	right_arm.move(my_pose);
	ROS_INFO("I am waving my hand");
	right_arm.wave_hand(5);
	ROS_INFO("I am going to somewhere with time limit 2 second");
	right_arm.add_movement(my_pose);
	right_arm.start_move();
	if (right_arm.wait_for_finish(2.0))
	{
		right_arm.stop_move();
	}

	return 0;
}

