//
//  interesting_moves_example.cpp
//  ROS
//
//  Created by Shipei Tian on 10/22/15.
//  Copyright © 2015 Shipei. All rights reserved.
//

#include <my_interesting_moves/my_interesting_moves.h>

const double sleep_time = 3;                            // sleep time before each movement apply

int main(int argc, char** argv)
{
	int joint;
	double angle;
	double my_pose[] = {0.5, 0.2, 0, 0.4, 0, -0.7, 0};
    //-0.100000, 0.100000, 0.000000, 0.600000, 0.000000, -0.500000, 0.000000
    //-0.100000, -0.200000, 0.000000, 1.400000, 0.000000, -1.000000, 0.000000
	ros::init(argc, argv, "interesting_moves_example");   // name this node
	ros::NodeHandle nh;                                 // standard ros node handle
	ros::Duration(sleep_time).sleep();                  // wait for other nodes
	Baxter_right_arm right_arm(&nh);                    // create our object
	while (ros::ok()) {
		ROS_WARN("Current pose: [%f, %f, %f, %f, %f, %f, %f]",
				 my_pose[0], my_pose[1], my_pose[2], my_pose[3],
				 my_pose[4], my_pose[5], my_pose[6]);
		right_arm.move(my_pose);                            // this is the normal way of move the arm
		std::cout << "Joint:";
		std::cin >> joint;
		std::cout << "Angle:";
		std::cin >> angle;
		my_pose[joint] += angle;
	}
	return 0;
}

