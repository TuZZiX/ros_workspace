#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <std_msgs/Bool.h> // boolean message
#include <std_msgs/Float64.h>
#include <nav_msgs/Odometry.h>
#include <math.h>
#include <vector>

#define NONE		0
#define FORWARD		1
#define BACKWARD	2
#define RIGHT		3
#define LEFT		4

double adjust_time = 0.01; //specify a sample period of 10ms
bool g_lidar_alarm = false; // global var for lidar alarm
//bool is_move = false; // for alternative control method
int move_cnt;
double opt_dir = 0;
double orientation = 0;

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

class RobotCommander {
private:
    ros::NodeHandle nh_;
    ros::Publisher *twist_commander;
    //some "magic numbers"
    const double sample_dt = 0.001;
    const double speed = 1.0; // 1m/s speed command
    const double yaw_rate = 0.5; //0.5 rad/sec yaw rate command
    geometry_msgs::Twist twist_cmd; //this is the message type required to send twist commands to STDR
public:
    RobotCommander(ros::NodeHandle* nodehandle): nh_(*nodehandle)
    {
        static ros::Publisher twist_commander_ = nh_.advertise<geometry_msgs::Twist>("/robot0/cmd_vel", 1);
        twist_commander = &twist_commander_;
    }
    RobotCommander(void) {
    }
    void stop() {
        ros::Rate loop_timer(1/sample_dt); //create a ros object from the ros “Rate” class; set 100Hz rate
        twist_cmd.linear.x = 0.0;
        twist_cmd.linear.y = 0.0;
        twist_cmd.linear.z = 0.0;
        twist_cmd.angular.x = 0.0;
        twist_cmd.angular.y = 0.0;
        twist_cmd.angular.z = 0.0;
        for (int i=0;i<10;i++) {
            (*twist_commander).publish(twist_cmd);
            loop_timer.sleep();
            ros::spinOnce();
        }
    }
    void turn(double rad) {

        double time = abs(rad)/yaw_rate;
        double timer = 0.0;
        ros::Rate loop_timer(1/sample_dt); //create a ros object from the ros “Rate” class; set 100Hz rate

        // start with all zeros in the command message; should be the case by default, but just to be safe..
        twist_cmd.linear.x = 0.0;
        twist_cmd.linear.y = 0.0;
        twist_cmd.linear.z = 0.0;
        twist_cmd.angular.x = 0.0;
        twist_cmd.angular.y = 0.0;
        twist_cmd.angular.z = 0.0;
        if (rad == 0) {

        } else if (rad > 0.0) {
            twist_cmd.angular.z = yaw_rate;
            ROS_INFO("Turn left");
        } else if (rad < 0.0){
            twist_cmd.angular.z = -1.0 * yaw_rate;
            ROS_INFO("Turn right");
        }
        while(timer<time) {
            (*twist_commander).publish(twist_cmd);
            timer+=sample_dt;
            loop_timer.sleep();
            ros::spinOnce();
        }
        twist_cmd.angular.z=0.0;
        for (int i=0;i<10;i++) {
            (*twist_commander).publish(twist_cmd);
            loop_timer.sleep();
            ros::spinOnce();
        }

    }
    void spin(int direction) {
        ros::Rate loop_timer(1/sample_dt); //create a ros object from the ros “Rate” class; set 100Hz rate
        twist_cmd.linear.x = 0.0;
        twist_cmd.linear.y = 0.0;
        twist_cmd.linear.z = 0.0;
        twist_cmd.angular.x = 0.0;
        twist_cmd.angular.y = 0.0;
        twist_cmd.angular.z = 0.0;
        switch (direction) {
            case NONE:
                break;
            case LEFT:
                twist_cmd.angular.z = yaw_rate;
                break;
            case RIGHT:
                twist_cmd.angular.z = -1.0 * yaw_rate;
                break;
            default:
                break;
        }
        for (int i=0;i<10;i++) {
            (*twist_commander).publish(twist_cmd);
            loop_timer.sleep();
            ros::spinOnce();
        }
    }
    void move(int direction, double time) {

        double timer=0.0;
        ros::Rate loop_timer(1/sample_dt); //create a ros object from the ros “Rate” class; set 100Hz rate

        // start with all zeros in the command message; should be the case by default, but just to be safe..
        twist_cmd.linear.x = 0.0;
        twist_cmd.linear.y = 0.0;
        twist_cmd.linear.z = 0.0;
        twist_cmd.angular.x = 0.0;
        twist_cmd.angular.y = 0.0;
        twist_cmd.angular.z = 0.0;
        switch (direction) {
            case NONE:
                break;
            case FORWARD:
                twist_cmd.linear.x = speed;
                break;
            case BACKWARD:
                twist_cmd.linear.x = -1.0 * speed;
                break;
            default:
                break;
        }
        while(timer<time) {
            (*twist_commander).publish(twist_cmd);
            timer+=sample_dt;
            loop_timer.sleep();
            ros::spinOnce();
        }
    }
    void move(double time) {
        if (time >= 0) {
            move(FORWARD, time);
        } else {
            move(BACKWARD, -1 * time);
        }
    }
    void go(int direction) {
        ros::Rate loop_timer(1/sample_dt); //create a ros object from the ros “Rate” class; set 100Hz rate
        // start with all zeros in the command message; should be the case by default, but just to be safe..
        twist_cmd.linear.x = 0.0;
        twist_cmd.linear.y = 0.0;
        twist_cmd.linear.z = 0.0;
        twist_cmd.angular.x = 0.0;
        twist_cmd.angular.y = 0.0;
        twist_cmd.angular.z = 0.0;
        switch (direction) {
            case NONE:
                break;
            case FORWARD:
                twist_cmd.linear.x = speed;
                break;
            case BACKWARD:
                twist_cmd.linear.x = -1.0 * speed;
                break;
            default:
                break;
        }
        for (int i=0;i<10;i++) {
            (*twist_commander).publish(twist_cmd);
            loop_timer.sleep();
            ros::spinOnce();
        }
    }
};

void alarmCallback(const std_msgs::Bool& alarm_msg)
{
    g_lidar_alarm = alarm_msg.data; //make the alarm status global, so main() can use it
    if (g_lidar_alarm) {
        //ROS_INFO("LIDAR alarm received!");
    }
}
void directionCallback(const std_msgs::Float64& direction_msg) {
    opt_dir = direction_msg.data;
}

// for orientation feedback control
void odemCallback(const nav_msgs::Odometry& odom_msg) {
    double quat[4];
    std::vector<double> euler_r;
    quat[0] = odom_msg.pose.pose.orientation.x;
    quat[1] = odom_msg.pose.pose.orientation.y;
    quat[2] = odom_msg.pose.pose.orientation.z;
    quat[3] = odom_msg.pose.pose.orientation.w;
    euler_r = euler(quat);
    orientation = euler_r[2];
}

//node to send Twist commands to the Simple 2-Dimensional Robot Simulator via cmd_vel
int main(int argc, char **argv) {
    ros::init(argc, argv, "feedback_solver"); 
    ros::NodeHandle n; // two lines to create a publisher object that can talk to ROS
    ros::Subscriber alarm_subscriber = n.subscribe("lidar_alarm",1,alarmCallback);
    ros::Subscriber direction_subscriber = n.subscribe("opt_direction", 1, directionCallback);
    ros::Subscriber odem_subscriber = n.subscribe("/robot0/odom", 1, odemCallback);
    RobotCommander robot(&n);

    ros::Rate loop_timer(1/adjust_time); //create a ros object from the ros “Rate” class; set 100Hz rate

    //start sending some zero-velocity commands, just to warm up communications with STDR
    robot.move(NONE, 3.0);

    while(ros::ok()) { // do forever
        if (g_lidar_alarm) {
            ROS_INFO("Back from wall");
            if (opt_dir > M_PI/2 || opt_dir < -1*M_PI/2) {
                opt_dir = opt_dir - M_PI;
                robot.turn(opt_dir);
                robot.move(-0.1);
            } else {
                robot.turn(opt_dir);
                robot.move(0.1);
            }
            g_lidar_alarm = false;
            //is_move = true;
            move_cnt = 0;
            ROS_INFO("Best direction: %f degree", (opt_dir/M_PI)*180);
            ROS_INFO("Current orientation: %f degree", (orientation/M_PI)*180);
        }
        else {
            /*
             * alternative way to turn, worse than current
            if (opt_dir > (3.0 / 180.0) * M_PI) {
                if (is_move) {
                    robot.stop();
                    is_move = false;
                    ROS_INFO("Turn left");
                }
                robot.spin(LEFT);
            } else if (opt_dir < (-3.0 / 180.0) * M_PI) {
                if (is_move) {
                    robot.stop();
                    is_move = false;
                    ROS_INFO("Turn right");
                }
                robot.spin(RIGHT);
            } else {
                if (is_move == false) {
                    robot.go(FORWARD);
                    is_move = true;
                    ROS_INFO("Go!");
                }
            }*/
            if (move_cnt < 2) {
                robot.turn(opt_dir);
                move_cnt = 5;
                ROS_INFO("Best direction: %f degree", (opt_dir/M_PI)*180);
                ROS_INFO("Current orientation: %f degree", (orientation/M_PI)*180);
            } else {
                robot.move(0.1);
                move_cnt--;
            }

        }
        //loop_timer.sleep();
        ros::spinOnce();
     }          
    //done commanding the robot; node runs to completion
}

