#include <ros/ros.h> /* ALWAYS need to include this */
#include <gazebo_msgs/GetModelState.h>
#include <gazebo_msgs/ApplyJointEffort.h>
#include <gazebo_msgs/GetJointProperties.h>
#include <sensor_msgs/JointState.h>
#include <iostream>
#include <string>
#include <cmath>
#include <std_msgs/Float64.h>


using namespace std;

const int		total_joint_number = 3;
const string	joint_name[] = {
	"joint1", "joint2", "joint3"
};
const double	control_speed = 1000;/*Hz*/	// this represent how fast this program runs, faster control speed reduce response time and smooth the output trajectory, slow down control speed can save your CPU resource
const double	Kp = 25.0;					// factor of error
const double	Kv = 5.0;					// amplify velocity

double	jnt_cmd[total_joint_number];		// joint command

void jnt1_CmdCB(const std_msgs::Float64 & cmd_msg)	// update command for joint1
{
	ROS_INFO("joint1 new command is: %f", cmd_msg.data);
	jnt_cmd[0] = cmd_msg.data;
}

void jnt2_CmdCB(const std_msgs::Float64 & cmd_msg)	// update command for joint2
{
	ROS_INFO("joint2 new command is: %f", cmd_msg.data);
	jnt_cmd[1] = cmd_msg.data;
}

void jnt3_CmdCB(const std_msgs::Float64 & cmd_msg)	// update command for joint3
{
	ROS_INFO("joint3 new command is: %f", cmd_msg.data);
	jnt_cmd[2] = cmd_msg.data;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "trajectory_controller");		// name the node
	ros::NodeHandle nh;									// create a node handle
	ros::Duration	half_sec(0.5);						// wait 0.5s for service

														// make sure service is available before attempting to proceed, else node will crash
	bool service_ready = false;
	while (!service_ready)								// keep trying to find the service
	{
		service_ready = ros::service::exists("/gazebo/apply_joint_effort", true);	// check apply service availability
		ROS_INFO("waiting for apply_joint_effort service");
		half_sec.sleep();									// retry after 0.5s
	}
	ROS_INFO("apply_joint_effort service exists");

	ros::ServiceClient set_trq_client =
		nh.serviceClient<gazebo_msgs::ApplyJointEffort>("/gazebo/apply_joint_effort");	// create client to apply our result

	service_ready = false;
	while (!service_ready)								// keep trying to find the service
	{
		service_ready = ros::service::exists("/gazebo/get_joint_properties", true);	// check property service availability
		ROS_INFO("waiting for /gazebo/get_joint_properties service");
		half_sec.sleep();									// retry after 0.5s
	}
	ROS_INFO("/gazebo/get_joint_properties service exists");

	ros::ServiceClient get_jnt_state_client =
		nh.serviceClient<gazebo_msgs::GetJointProperties>("/gazebo/get_joint_properties");// create client to get joint state, get feedback of our control

	gazebo_msgs::ApplyJointEffort	effort_cmd_srv_msg[3];		// message to apply control output to joint1
	gazebo_msgs::GetJointProperties get_joint_state_srv_msg[3];	// message that used for get current position and speed for joint1

	ros::Publisher joint_state_publisher = nh.advertise<sensor_msgs::JointState>("joint_states", 1);	// publish joint state to joint_state_publisher, so that we can have model on rviz

	ros::Subscriber jnt1_amp_subscriber = nh.subscribe("jnt1_cmd", 1, jnt1_CmdCB);// update amplitude for joint1
	ros::Subscriber jnt1_feq_subscriber = nh.subscribe("jnt2_cmd", 1, jnt2_CmdCB);// update frequency for joint2
	ros::Subscriber jnt2_amp_subscriber = nh.subscribe("jnt3_cmd", 1, jnt3_CmdCB);// update amplitude for joint3

	sensor_msgs::JointState joint_state_msg[3];		// joint1 state for joint_state_publisher

	double	jnt_pos, jnt_vel;			// joint position and velocity
	double	error;
	double	trq_cmd;					// effort output

	ros::Duration	duration(1 / control_speed);	// duration for each message
	ros::Rate	rate_timer(control_speed);		// span of one control cycle

	for (int j = 0; j < total_joint_number; j++)
	{
		effort_cmd_srv_msg[j].request.joint_name = joint_name[j];	// joint name
		effort_cmd_srv_msg[j].request.effort = 0.0;			// the control output start with 0
		effort_cmd_srv_msg[j].request.duration = duration;		// duration for each control output is 0.001s

		get_joint_state_srv_msg[j].request.joint_name = joint_name[j];	// inquire state of joints

		// message that publish current position of joints to robot_state_publisher so that it can give tf to rviz to know and display where our two joint is
		joint_state_msg[j].header.stamp = ros::Time::now();	// fill the header
		joint_state_msg[j].name.push_back(joint_name[j].c_str());			// joint name
		joint_state_msg[j].position.push_back(0.0);			// initial position
		joint_state_msg[j].velocity.push_back(0.0);			// initial velocity
	}

	while (ros::ok())
	{
		for (int i = 0; i < total_joint_number; i++)
		{
			get_jnt_state_client.call(get_joint_state_srv_msg[i]);			// get joint1 state
			jnt_pos = get_joint_state_srv_msg[i].response.position[0];
			jnt_vel = get_joint_state_srv_msg[i].response.rate[0];

			joint_state_msg[i].header.stamp = ros::Time::now();				// fill the message
			joint_state_msg[i].position[0] = jnt_pos;
			joint_state_msg[i].velocity[0] = jnt_vel;
			joint_state_publisher.publish(joint_state_msg[i]);				// publish this state to robot_state_publisher

			error = jnt_cmd[i] - jnt_pos;		// calculate control error
			if (error > M_PI)					// if desired position is at the front
			{
				error -= 2 * M_PI;				// move front to get to the position
			}
			if (error < -M_PI)					// move back ....
			{
				error += 2 * M_PI;
			}

			trq_cmd = Kp * (error)-Kv * jnt_vel;	// calculate control output
															// send torque command to Gazebo
			effort_cmd_srv_msg[i].request.effort = trq_cmd;	// tell gazebo our new control signal
			set_trq_client.call(effort_cmd_srv_msg[i]);		// send to gazebo
															// make sure service call was successful
			bool result1 = effort_cmd_srv_msg[i].response.success;
			if (!result1)						// if call not done
				ROS_WARN("service call to apply_joint_effort failed in %s!",joint_name[i].c_str());
		}

		ros::spinOnce();				// wait for callback
		rate_timer.sleep();				// sleep for 0.001s and start another cycle
	}
	return 0;
}



