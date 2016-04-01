#include <ros/ros.h>
#include <wall_follower/path.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/PoseStamped.h>
#include <std_srvs/Trigger.h>
#include <wall_follower/lidar.h>

using namespace std;

geometry_msgs::Quaternion convertPlanarPhi2Quaternion(double phi) {
    geometry_msgs::Quaternion quaternion;
    quaternion.x = 0.0;
    quaternion.y = 0.0;
    quaternion.z = sin(phi / 2.0);
    quaternion.w = cos(phi / 2.0);
    return quaternion;
}

bool g_alarm = false; // global var for lidar alarm
bool f_alarm = false;
bool l_alarm = false;
bool r_alarm = false;
bool world_empty = false;
double g_distance = 0.0;
double f_distance = 0.0;
double l_distance = 0.0;
double r_distance = 0.0;
double alarm_dir = 0.0;
double opt_dir = 0.0;

geometry_msgs::Pose g_current_pose;
double UPDATE_RATE = 4.0;
/*
void alarmCallback(const std_msgs::Bool& alarm_msg) {
    g_alarm = alarm_msg.data; //make the alarm status global, so main() can use it
}*/
void lidarCallback(const wall_follower::lidar& lidar_msg) {
    g_alarm = lidar_msg.g_alarm;
    f_alarm = lidar_msg.f_alarm;
    l_alarm = lidar_msg.l_alarm;
    r_alarm = lidar_msg.r_alarm;
    world_empty = lidar_msg.world_empty;
    g_distance = lidar_msg.g_distance;
    f_distance = lidar_msg.f_distance;
    l_distance = lidar_msg.l_distance;
    r_distance = lidar_msg.r_distance;
    alarm_dir = lidar_msg.alarm_dir;
    opt_dir = lidar_msg.wide_dir;
}
// get start orientation
void odomCallback(const nav_msgs::Odometry& odom_msg) {
    g_current_pose = odom_msg.pose.pose;
}

void go_back(wall_follower::path &path_srv){
    geometry_msgs::Quaternion quat;
    geometry_msgs::PoseStamped pose_stamped;
    pose_stamped.header.frame_id = "world";
    geometry_msgs::Pose pose;
    pose.position.x = 5.0; // say desired x-coord is 5
    pose.position.y = 0.0;
    pose.position.z = 0.0; // let's hope so!
    quat = convertPlanarPhi2Quaternion(0);
    pose.orientation = quat;
    pose_stamped.pose = pose;
    path_srv.request.path.poses.push_back(pose_stamped);

    pose.position.y = 5.0;
    pose_stamped.pose = pose;
    path_srv.request.path.poses.push_back(pose_stamped);

    pose.position.x = 0.0;
    pose_stamped.pose = pose;
    path_srv.request.path.poses.push_back(pose_stamped);

    pose.position.y = 0.0;
    pose_stamped.pose = pose;
    path_srv.request.path.poses.push_back(pose_stamped);

    //repeat (x,y) with new heading:
    pose_stamped.pose.orientation = convertPlanarPhi2Quaternion(0);
    path_srv.request.path.poses.push_back(pose_stamped);
}
void go_forward(){

}
void turn_left(){

}
void turn_right(){

}
void presue_opt(){

}
int main(int argc, char **argv) {
    ros::init(argc, argv, "wall_follower");
    ros::NodeHandle nh;
    ros::ServiceClient client = nh.serviceClient<wall_follower::path>("append_path_queue_service");
    ros::ServiceClient flush = nh.serviceClient<std_srvs::Trigger>("flush_path_queue_service");
    ros::ServiceClient estop = nh.serviceClient<std_srvs::Trigger>("estop_service");
    ros::ServiceClient clear_estop = nh.serviceClient<std_srvs::Trigger>("clear_estop_service");
    //ros::Subscriber alarm_subscriber = nh.subscribe("lidar_alarm",1,alarmCallback);
    ros::Subscriber lidar_subscriber = nh.subscribe("lidar_info", 1, lidarCallback);
    ros::Subscriber odem_subscriber = nh.subscribe("odom", 1, odomCallback);
    while (!client.exists()) {
        ROS_INFO("waiting for service...");
        ros::Duration(1.0).sleep();
        ros::spinOnce();
    }
    //ROS_INFO("connected client to service");
    std_srvs::Trigger trigger;
    wall_follower::path path_srv;

    ros::Rate looprate(UPDATE_RATE);

    flush.call(trigger);
    go_back(path_srv);
    client.call(path_srv);




    while (ros::ok()) {
        ros::spinOnce();
        looprate.sleep(); //sleep for defined sample period, then do loop again
    }
}

