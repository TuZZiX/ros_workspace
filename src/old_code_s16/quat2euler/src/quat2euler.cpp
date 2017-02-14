#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <std_msgs/Float64.h>
#include <nav_msgs/Odometry.h>
#include <quat2euler/stamped_float3.h>

ros::Publisher euler_pub_;


// orientation to euler
std::vector<double> euler(double mData[4]) {
    std::vector<double> euler(3);
    const static double PI_OVER_2 = M_PI * 0.5;
    const static double EPSILON = 1e-10;
    double sqw, sqx, sqy, sqz;

    // quick conversion to Euler angles to give tilt to user
    sqw = mData[3]*mData[3];
    sqx = mData[0]*mData[0];
    sqy = mData[1]*mData[1];
    sqz = mData[2]*mData[2];

    euler[1] = asin(2.0 * (mData[3]*mData[1] - mData[0]*mData[2]));
    if (PI_OVER_2 - fabs(euler[1]) > EPSILON) {
        euler[2] = atan2(2.0 * (mData[0]*mData[1] + mData[3]*mData[2]),
                         sqx - sqy - sqz + sqw);
        euler[0] = atan2(2.0 * (mData[3]*mData[0] + mData[1]*mData[2]),
                         sqw - sqx - sqy + sqz);
    } else {
        // compute heading from local 'down' vector
        euler[2] = atan2(2*mData[1]*mData[2] - 2*mData[0]*mData[3],
                         2*mData[0]*mData[2] + 2*mData[1]*mData[3]);
        euler[0] = 0.0;

        // If facing down, reverse yaw
        if (euler[1] < 0)
            euler[2] = M_PI - euler[2];
    }
    return euler;
}
// for orientation feedback control
void odomCallback(const nav_msgs::Odometry& odom_msg) {
    quat2euler::stamped_float3 msg;
    double quat[4];
    std::vector<double> euler_r;
    quat[0] = odom_msg.pose.pose.orientation.x;
    quat[1] = odom_msg.pose.pose.orientation.y;
    quat[2] = odom_msg.pose.pose.orientation.z;
    quat[3] = odom_msg.pose.pose.orientation.w;
    euler_r = euler(quat);
    ROS_INFO("direction from odom is X:%f, Y:%f, Z:%f", euler_r[0], euler_r[1], euler_r[2]);
    msg.x = euler_r[0];
    msg.y = euler_r[1];
    msg.z = euler_r[2];
    msg.header = odom_msg.header;
    euler_pub_.publish(msg);
}

//node to send Twist commands to the Simple 2-Dimensional Robot Simulator via cmd_vel
int main(int argc, char **argv) {
    ros::init(argc, argv, "quat2euler");
    ros::NodeHandle n; // two lines to create a publisher object that can talk to ROS
    ros::Subscriber odom_subscriber = n.subscribe("/odom", 1, odomCallback);
    ros::Publisher euler_pub = n.advertise<quat2euler::stamped_float3>( "euler_angle", 1 );
    euler_pub_ = euler_pub;
    ros::spin();
}

