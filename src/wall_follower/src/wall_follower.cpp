#include "pub_des_state/pub_des_state.h"
#include <wall_follower/lidar.h>

bool g_lidar_alarm = false; // global var for lidar alarm
geometry_msgs::Pose g_current_pose;

void alarmCallback(const std_msgs::Bool& alarm_msg) {
    g_lidar_alarm = alarm_msg.data; //make the alarm status global, so main() can use it
}
void lidarCallback(const wall_follower::lidar& lidar_msg) {
}
// get start orientation
void odomCallback(const nav_msgs::Odometry& odom_msg) {
    g_current_pose = odom_msg.pose.pose;
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "wall_follower");
    ros::NodeHandle nh;
    //instantiate a desired-state publisher object
    DesStatePublisher desStatePublisher(nh);
    ros::Subscriber alarm_subscriber = nh.subscribe("lidar_alarm",1,alarmCallback);
    ros::Subscriber lidar_subscriber = nh.subscribe("lidar_info", 1, lidarCallback);
    ros::Subscriber odem_subscriber = nh.subscribe("odom", 1, odomCallback);
    //dt is set in header file pub_des_state.h    
    ros::Rate looprate(1 / dt); //timer for fixed publication rate
    desStatePublisher.set_init_pose(0,0,0); //x=0, y=0, psi=0
    //put some points in the path queue--hard coded here
    // main loop; publish a desired state every iteration
    while (ros::ok()) {
        desStatePublisher.pub_next_state();
        ros::spinOnce();
        looprate.sleep(); //sleep for defined sample period, then do loop again
    }
}

