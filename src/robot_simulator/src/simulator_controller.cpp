#include <ros/ros.h> /* ALWAYS need to include this */
#include <gazebo_msgs/GetModelState.h>
#include <gazebo_msgs/ApplyJointEffort.h>
#include <gazebo_msgs/GetJointProperties.h>
#include <sensor_msgs/JointState.h>
#include <iostream>
#include <std_msgs/Float64.h>
#include <cmath>

#define CONTROL_SPEED 100       /* this represent how much dot you will get in 1 second, it controls how fast this program runs, slow down ill save your CPU resource and reduce jetter of plot, but reduce the limitation of max frequency */

double	jnt1_amp	= 1.5;          /* set a default value to amplitude */
double	jnt1_feq	= 0.5;          /* set a default value to frequency */
double	jnt2_amp	= 1.0;          /* set a default value to amplitude */
double	jnt2_feq	= 1.0;          /* set a default value to frequency */

/* a simple saturation function; provide saturation threshold, sat_val, and arg to be saturated, val */
/*
double sat( double val, double sat_val )
{
	if ( val > sat_val )
		return(sat_val);
	if ( val < -sat_val )
		return(-sat_val);
	return(val);
}
*/
void jnt1_ampCmdCB( const std_msgs::Float64 & amp_cmd_msg )
{
	ROS_INFO( "received value of amplitude is: %f", amp_cmd_msg.data );
	jnt1_amp = amp_cmd_msg.data;
}

void jnt1_feqCmdCB( const std_msgs::Float64 & feq_cmd_msg )
{
	ROS_INFO( "received value of frequency is: %f", feq_cmd_msg.data );
	jnt1_feq = feq_cmd_msg.data;
}
void jnt2_ampCmdCB( const std_msgs::Float64 & amp_cmd_msg )
{
	ROS_INFO( "received value of amplitude is: %f", amp_cmd_msg.data );
	jnt2_amp = amp_cmd_msg.data;
}

void jnt2_feqCmdCB( const std_msgs::Float64 & feq_cmd_msg )
{
	ROS_INFO( "received value of frequency is: %f", feq_cmd_msg.data );
	jnt2_feq = feq_cmd_msg.data;
}

int main( int argc, char **argv )
{
	ros::init( argc, argv, "simulator_controllor" );
	ros::NodeHandle nh;
	ros::Duration	half_sec( 0.5 );
	
	/* make sure service is available before attempting to proceed, else node will crash */
	bool service_ready = false;
	while ( !service_ready )
	{
		service_ready = ros::service::exists( "/gazebo/apply_joint_effort", true );
		ROS_WARN( "waiting for apply_joint_effort service" );
		half_sec.sleep();
	}
	ROS_WARN( "apply_joint_effort service exists" );
	
	ros::ServiceClient set_trq_client =
	nh.serviceClient<gazebo_msgs::ApplyJointEffort>( "/gazebo/apply_joint_effort" );
	
	service_ready = false;
	while ( !service_ready )
	{
		service_ready = ros::service::exists( "/gazebo/get_joint_properties", true );
		ROS_WARN( "waiting for /gazebo/get_joint_properties service" );
		half_sec.sleep();
	}
	ROS_WARN( "/gazebo/get_joint_properties service exists" );
	
	ros::ServiceClient get_jnt_state_client =
	nh.serviceClient<gazebo_msgs::GetJointProperties>( "/gazebo/get_joint_properties" );
	
	gazebo_msgs::ApplyJointEffort	effort_cmd_srv_msg;
	gazebo_msgs::GetJointProperties get_joint_state_srv_msg;
	gazebo_msgs::ApplyJointEffort	effort_cmd_srv_msg2;
	gazebo_msgs::GetJointProperties get_joint_state_srv_msg2;
	
	/*
	 * ros::Publisher trq_publisher = nh.advertise<std_msgs::Float64>("jnt_trq", 1);
	 * ros::Publisher vel_publisher = nh.advertise<std_msgs::Float64>("jnt_vel", 1);
	 * ros::Publisher pos_publisher = nh.advertise<std_msgs::Float64>("jnt_pos", 1);
	 */
	ros::Publisher joint_state_publisher = nh.advertise<sensor_msgs::JointState>( "joint_states", 1 );
	
	ros::Subscriber jnt1_amp_subscriber = nh.subscribe( "jnt1_amp_cmd", 1, jnt1_ampCmdCB );
	ros::Subscriber jnt1_feq_subscriber = nh.subscribe( "jnt1_feq_cmd", 1, jnt1_feqCmdCB );
	ros::Subscriber jnt2_amp_subscriber = nh.subscribe( "jnt2_amp_cmd", 1, jnt2_ampCmdCB );
	ros::Subscriber jnt2_feq_subscriber = nh.subscribe( "jnt2_feq_cmd", 1, jnt2_feqCmdCB );
	
//	std_msgs::Float64	trq_msg;
//	std_msgs::Float64	q1_msg, q1dot_msg;
	sensor_msgs::JointState joint_state_msg;
	sensor_msgs::JointState joint_state_msg2;
	
	double		q1, q1dot, q2, q2dot;
	double		dt = 0.01;
	ros::Duration	duration( dt );
	ros::Rate	rate_timer( 1 / dt );
	
	effort_cmd_srv_msg.request.joint_name = "joint1";
	effort_cmd_srv_msg.request.effort = 0.0;
	effort_cmd_srv_msg.request.duration= duration;
	
	effort_cmd_srv_msg2.request.joint_name = "joint3";
	effort_cmd_srv_msg2.request.effort = 0.0;
	effort_cmd_srv_msg2.request.duration= duration;
	
	get_joint_state_srv_msg.request.joint_name = "joint1";
	get_joint_state_srv_msg2.request.joint_name = "joint3";
	/* double q1_des = 1.0; */
	double	q1_err, q2_err;
	double	Kp	= 10.0;
	double	Kv	= 3;
	double	trq_cmd;
	double  jnt1_cnt = 0, jnt2_cnt = 0;
	double  jnt1_cmd, jnt2_cmd;
	
	/*
	 * set up the joint_state_msg fields to define a single joint,
	 * called joint1, and initial position and vel values of 0
	 */
	joint_state_msg.header.stamp = ros::Time::now();
	joint_state_msg.name.push_back("joint1");
	joint_state_msg.position.push_back(0.0);
	joint_state_msg.velocity.push_back(0.0);
	
	joint_state_msg2.header.stamp = ros::Time::now();
	joint_state_msg2.name.push_back("joint3");
	joint_state_msg2.position.push_back(0.0);
	joint_state_msg2.velocity.push_back(0.0);
	while ( ros::ok() )
	{
		for ( int count = 0; count < CONTROL_SPEED; count++ )
		{
			if (jnt1_cnt++ >= (CONTROL_SPEED / jnt1_feq)) {
				jnt1_cnt = 0;
			}
			jnt1_cmd = jnt1_amp * (std::sin( ( (M_PI * 2) / (CONTROL_SPEED / jnt1_feq) ) * jnt1_cnt ) );
			
			if (jnt2_cnt++ >= (CONTROL_SPEED / jnt2_feq)) {
				jnt2_cnt = 0;
			}
			jnt2_cmd = jnt2_amp * (std::sin( ( (M_PI * 2) / (CONTROL_SPEED / jnt2_feq) ) * jnt2_cnt ) );
			
			get_jnt_state_client.call( get_joint_state_srv_msg );
			q1		= get_joint_state_srv_msg.response.position[0];
//			q1_msg.data	= q1;
//			pos_publisher.publish( q1_msg );
			
			q1dot		= get_joint_state_srv_msg.response.rate[0];
//			q1dot_msg.data	= q1dot;
//			vel_publisher.publish( q1dot_msg );
			
			joint_state_msg.header.stamp	= ros::Time::now();
			joint_state_msg.position[0]	= q1;
			joint_state_msg.velocity[0]	= q1dot;
			
			joint_state_publisher.publish( joint_state_msg );
			/*
			 * ROS_INFO("q1 = %f;  q1dot = %f",q1,q1dot);
			 * watch for periodicity
			 */
			q1_err = jnt1_cmd - q1;
			if ( q1_err > M_PI )
			{
				q1_err -= 2 * M_PI;
			}
			if ( q1_err < -M_PI )
			{
				q1_err += 2 * M_PI;
			}
			
			trq_cmd = Kp * (q1_err) - Kv * q1dot;
			/* trq_cmd = sat(trq_cmd, 10.0); //saturate at 1 N-m */
//			trq_msg.data = trq_cmd;
//			trq_publisher.publish( trq_msg );
			/* send torque command to Gazebo */
			effort_cmd_srv_msg.request.effort = trq_cmd;
			set_trq_client.call( effort_cmd_srv_msg );
			/* make sure service call was successful */
			bool result1 = effort_cmd_srv_msg.response.success;
			if ( !result1 )
				ROS_WARN( "service call to apply_joint_effort failed!" );
			
			
			get_jnt_state_client.call( get_joint_state_srv_msg2 );
			q2		= get_joint_state_srv_msg2.response.position[0];
			//			q1_msg.data	= q1;
			//			pos_publisher.publish( q1_msg );
			
			q2dot		= get_joint_state_srv_msg2.response.rate[0];
			//			q1dot_msg.data	= q1dot;
			//			vel_publisher.publish( q1dot_msg );
			
			joint_state_msg2.header.stamp	= ros::Time::now();
			joint_state_msg2.position[0]	= q2;
			joint_state_msg2.velocity[0]	= q2dot;
			
			joint_state_publisher.publish( joint_state_msg2 );
			
			/*
			 * ROS_INFO("q1 = %f;  q1dot = %f",q1,q1dot);
			 * watch for periodicity
			 */
			q2_err = jnt2_cmd - q2;
			if ( q2_err > M_PI )
			{
				q2_err -= 2 * M_PI;
			}
			if ( q2_err < -M_PI )
			{
				q2_err += 2 * M_PI;
			}
			
			trq_cmd = Kp * (q2_err) - Kv * q2dot;
			/* trq_cmd = sat(trq_cmd, 10.0); //saturate at 1 N-m */
			//			trq_msg.data = trq_cmd;
			//			trq_publisher.publish( trq_msg );
			/* send torque command to Gazebo */
			effort_cmd_srv_msg2.request.effort = trq_cmd;
			set_trq_client.call( effort_cmd_srv_msg2 );
			/* make sure service call was successful */
			bool result2 = effort_cmd_srv_msg2.response.success;
			if ( !result2 )
				ROS_WARN( "service call to apply_joint_effort failed!" );
			
			ros::spinOnce();
			rate_timer.sleep();
		}
	}
	return 0;
}


