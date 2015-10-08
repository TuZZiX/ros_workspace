//
//  minimal_commander.cpp
//  my_controllor
//
//  Created by 田适霈 on 9/2/15.
//  Copyright (c) 2015 Shipei. All rights reserved.
//


#include <iostream>
#include <cmath>
#include <ros/ros.h>
#include <std_msgs/Float64.h>

#define USE_KEYBOARD_INPUT      //if you are using roslaunch, disable this define and change the following value manually

#define _DEFAULT_AMP    50.0    //modify the value of amplitude here
#define _DEFAULT_FEQ    2.0     //modify the value of frequency here
#define _CONTROL_SPEED  1000    //slow down the fucntion if you want, this will save your CPU resource and reduce jetter of plot, but reduce the limitation of max frequency

double amp = _DEFAULT_AMP;  //set a default value to amplitude
double feq = _DEFAULT_FEQ;  //set a default value to frequency


#ifndef USE_KEYBOARD_INPUT
void updateAmp(const std_msgs::Float64& message_holder)
{
    amp = message_holder.data;
    ROS_INFO("amplitude change to: %f",message_holder.data);
}
void updateFeq(const std_msgs::Float64& message_holder)
{
    feq = message_holder.data;
    ROS_INFO("frequency change to: %f Hz",message_holder.data);
}
#endif


int main(int argc, char **argv) {
    std_msgs::Float64 g_vel_cmd;//message buffer to send out
    int count;  //temporary various
    ros::init(argc, argv, "minimal_commander"); //name this node
    // when this compiled code is run, ROS will recognize it as a node called "minimal_commander"
    ros::NodeHandle nh; // node handle
    ros::Rate naptime(_CONTROL_SPEED); //make the output value change by 1ms
    ros::Publisher my_publisher_object = nh.advertise<std_msgs::Float64>("vel_cmd", 1); //publish the output value to the topic "vel_cmd"
    
#ifdef USE_KEYBOARD_INPUT
    double angle;   //"angle" is used to storage the angle each time should increased
    int time,type;  //some temporary various
    ROS_INFO("If you want a sinusoidial vel_cmd, please input 1,");
    ROS_INFO("If you just want to vel_cmd to a value, please input 2:");
    std::cin >> type;
    
    switch (type) { //select the function you want
        case 1:
        {
            ROS_INFO("Please input the amplitude of the output:");
            std::cin >> amp;
            ROS_INFO("Please input the frequency(Hz):");
            std::cin >> feq;
            if (feq <= 0 | feq >= (_CONTROL_SPEED/4)) { //check input
                ROS_INFO("the frequency is too large or small, try another!");
                break;
            }
            time = (int) (_CONTROL_SPEED / feq);    //calculate the times(number of ms) of value changes during a single wave, int is better for for-statement
            angle = (M_PI * 2) / (_CONTROL_SPEED / feq);    //calculate the angle (rad/ms) each time should increased, π×2 is one circle
            while (ros::ok()) { //keep runing this
                for (count = 0; count < time; count++) {    //a single wave
                    naptime.sleep();    //a single time span, just suppose your CPU is power enough so that we could ignore the time of doing following works
                    g_vel_cmd.data = amp * (std::sin(angle * count));   //angle×count is the current angle, do sin, and amplify it
                    my_publisher_object.publish(g_vel_cmd); //ready to send
                    ROS_INFO("Velocity set to: %f", g_vel_cmd.data); //print value to console
                }
            }
        }
            break;
        case 2:
        {
            ROS_INFO("Please input the value:");
            std::cin >> g_vel_cmd.data;             //direct output
            my_publisher_object.publish(g_vel_cmd); //ready to send
            ROS_INFO("Velocity set to: %f", g_vel_cmd.data);    //print value to console
        }
            break;
        default:    //check input
            ROS_INFO("I think you have input a wrong number!");
            break;
    }
    #endif
    
#ifndef USE_KEYBOARD_INPUT
    ros::Publisher my_publisher_object1 = nh.advertise<std_msgs::Float64>("Amp_cmd", 1);    //provide addtional solution if you run if through roslaunch
    ros::Publisher my_publisher_object2 = nh.advertise<std_msgs::Float64>("Feq_cmd", 1);    //you can just use "rostopic pub" to change the amplitude and frequency
    ros::Subscriber my_subscriber_object1 = nh.subscribe("Amp_cmd", 1, updateAmp);  //update the value if you "pub" the values
    ros::Subscriber my_subscriber_object2 = nh.subscribe("Feq_cmd", 1, updateFeq);
    {
        std_msgs::Float64 pub_temp; //create a temporary vars, and delete after use
        pub_temp.data = amp;
        my_publisher_object1.publish(pub_temp);
        pub_temp.data = feq;
        my_publisher_object2.publish(pub_temp);
    }
    //this codes are similar to the above, except it calucate all value in real time and maybe slower, but can let you change the value of amp and feq any time
    while (ros::ok()) { //keep runing this
        for (count = 0; count < (int) (_CONTROL_SPEED / feq); count++) {    //calculate the times(number of ms) of value changes during a single wave
            naptime.sleep();    //a single time span, just suppose your CPU is power enough so that we could ignore the time of doing following works
            g_vel_cmd.data = amp * (std::sin(((M_PI * 2) / (_CONTROL_SPEED / feq)) * count));   //calculate the current angle (rad), π×2 is one circle, do sin, and amplify it
            my_publisher_object.publish(g_vel_cmd); //ready to send
            ROS_INFO("Velocity set to: %f", g_vel_cmd.data); //print value to console
        }
    }
#endif
    return 0; // should never get here, unless roscore dies
}
