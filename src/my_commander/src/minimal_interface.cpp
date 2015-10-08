//
//  minimal_interface.cpp
//  my_commander
//
//  Created by 田适霈 on 9/18/15.
//  Copyright © 2015 Shipei. All rights reserved.
//


#include <iostream>
#include <ros/ros.h>
#include <my_commander/interface_cmd.h>


#define DEFAULT_AMP    50.0     //default amplitude
#define DEFAULT_FEQ    2.0      //default frequency(Hz)
#define DEFAULT_STA    false    //default state, run=true, stop=false

int main(int argc, char **argv) {
    int func;
    ros::init(argc, argv, "minimal_interface"); //name this node
    ros::NodeHandle nh; // node handle
    ros::ServiceClient client = nh.serviceClient<my_commander::interface_cmd>("command_msgs");
    my_commander::interface_cmd srv;
    srv.response.success = false;
    srv.request.start = DEFAULT_STA;
    srv.request.amp_cmd = DEFAULT_AMP;
    srv.request.feq_cmd = DEFAULT_FEQ;
    while (ros::ok()) { //keep runing this
    retry:
        std::cout<<std::endl<<std::endl<<std::endl<<std::endl<<std::endl;
        std::cout<<"----------------------------------------------"<<std::endl;
        std::cout<<"Current state:  Amplitude:      Frequency(Hz):"<<std::endl;
        if (srv.request.start)
            std::cout<<"Run             ";
        else
            std::cout<<"Stop            ";
        std::cout<<srv.request.amp_cmd<<"              "<<srv.request.feq_cmd<<std::endl;
        std::cout<<"----------------------------------------------"<<std::endl;
        std::cout<<"1 = change state"<<std::endl;
        std::cout<<"2 = change amplitude"<<std::endl;
        std::cout<<"3 = change frequency(Hz)"<<std::endl;
        std::cout<<"----------------------------------------------"<<std::endl;
        std::cout<<"Select:";
        std::cin>>func;
        switch (func) {
            case 1:
                int state;
                std::cout<<std::endl<<"1 = run, 2 = stop"<<std::endl;
                std::cout<<"Input your new state:";
                std::cin>>state;
                if (state == 1)
                    srv.request.start = true;
                else
                    srv.request.start = false;
                break;
            case 2:
                std::cout<<"Input your new amplitude:";
                std::cin>>srv.request.amp_cmd;
                break;
            case 3:
                std::cout<<"Input your new frequency(Hz):";
                std::cin>>srv.request.feq_cmd;
                break;
            default:
                std::cout<<"Wrong input, please retry!"<<std::endl;
                goto retry;
                break;
        }
//        ROS_INFO("Call service command_msgs");
        if (client.call(srv)) {
            if(srv.response.success)
                std::cout<<"Change applied!"<<std::endl;
            else
                std::cout<<"Failed to apply!"<<std::endl;
            srv.response.success = false;
        }
        else {
            ROS_ERROR("Failed to call service command_msgs");
            return 1;
        }
    }
    return 0; // should never get here, unless roscore dies
}