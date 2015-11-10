//
//  interesting_moves_example.cpp
//  ROS
//
//  Created by Shipei Tian on 10/22/15.
//  Copyright © 2015 Shipei. All rights reserved.
//

#include <my_interesting_moves/my_interesting_moves.h>

const double sleep_time = 3;                            // sleep time before each movement apply
const double my_pose1[] = {-0.100000, -0.200000, 0.000000, 1.400000, 0.000000, -0.950000, 0.000000};
const double my_pose2[] = {-0.100000, 0.100000, 0.000000, 0.600000, 0.000000, -0.450000, 0.000000};
const double my_pose3[] = {0.5, 0.2, 0, 0.4, 0, -0.7, 0};
const double my_pose4[] = {0, 0, 0, 0, 0, 0, 0};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "my_interesting_moves");   // name this node
    ros::NodeHandle nh;                                 // standard ros node handle
    ros::Duration(sleep_time).sleep();                  // wait for other nodes
    Baxter_right_arm right_arm(&nh);                    // create our object

    right_arm.move(my_pose3);
    ROS_WARN("I am going to push the beer off the table");
    ros::Duration(sleep_time).sleep();
    right_arm.push_beer();
    ros::Duration(sleep_time).sleep();
    right_arm.move(my_pose4);
    ros::Duration(sleep_time).sleep();
    right_arm.move(my_pose1);
    right_arm.move(my_pose2);
    ros::Duration(sleep_time).sleep();
    right_arm.wave_hand(3);
/*
    ROS_WARN("I am moving to an arbitrary pose [%f, %f, %f, %f, %f, %f, %f]",
            my_pose[0], my_pose[1], my_pose[2], my_pose[3],
            my_pose[4], my_pose[5], my_pose[6]);
    ros::Duration(sleep_time).sleep();
    right_arm.move(my_pose);
    ROS_WARN("I am moving to an arbitrary pose [%f, %f, %f, %f, %f, %f, %f]",
            my_pose2[0], my_pose2[1], my_pose2[2], my_pose2[3],
            my_pose2[4], my_pose2[5], my_pose2[6]);
    right_arm.move(my_pose);
                                // this is the normal way of move the arm
    ROS_WARN("I am going to wave my right hand 3 times");
    ros::Duration(sleep_time).sleep();
    right_arm.wave_hand(3);

    ROS_WARN("I am moving to an impossible pose [%f, %f, %f, %f, %f, %f, %f] to see what will happens",
            impossible_pose[0], impossible_pose[1], impossible_pose[2], impossible_pose[3],
            impossible_pose[4], impossible_pose[5], impossible_pose[6]);
    ROS_WARN("I have a time limit of 15 seconds");
    ros::Duration(sleep_time).sleep();
    // here is another approach of move the arm
    right_arm.add_movement(impossible_pose);            // add the movement to the sequence
    right_arm.start_move();                             // start moving
    if (right_arm.wait_for_finish(15.0) == false)       // wait for finish for 10 seconds
    {
        ROS_WARN("I did not finished on time, I will stop");    // if not finished
        right_arm.stop_move();                          // stop moving
    }*/
    return 0;
}

