#include <ros/ros.h>  /* ALWAYS need to include this */
#include <gazebo_msgs/GetModelState.h>
#include <gazebo_msgs/ApplyJointEffort.h>
#include <gazebo_msgs/GetJointProperties.h>
#include <sensor_msgs/JointState.h>
#include <iostream>
#include <std_msgs/Float64.h>
#include <cmath>

const double CONTROL_SPEED = 100;								/* this represent how fast this program runs, faster control speed reduce response time and smooth the output trajectory, slow down control spped can save your CPU resource*/

double	jnt1_amp = 1.5;                                  /* joint1 default amplitude */
double	jnt1_feq = 0.5;                                  /* joint1 default frequency */
double	jnt2_amp = 1.0;                                  /* joint3 default amplitude */
double	jnt2_feq = 1.0;                                  /* joint3 default frequency */


void jnt1_ampCmdCB(const std_msgs::Float64 & amp_cmd_msg)     /* update amplitude for joint1 */
{
	ROS_INFO("joint1 new amplitude is: %f", amp_cmd_msg.data);
	jnt1_amp = amp_cmd_msg.data;
}


void jnt1_feqCmdCB(const std_msgs::Float64 & feq_cmd_msg)     /* update frequency for joint1 */
{
	ROS_INFO("joint1 new frequency is: %f", feq_cmd_msg.data);
	jnt1_feq = feq_cmd_msg.data;
}


void jnt2_ampCmdCB(const std_msgs::Float64 & amp_cmd_msg)     /* update amplitude for joint3 */
{
	ROS_INFO("joint3 new amplitude is: %f", amp_cmd_msg.data);
	jnt2_amp = amp_cmd_msg.data;
}


void jnt2_feqCmdCB(const std_msgs::Float64 & feq_cmd_msg)     /* update frequency for joint3 */
{
	ROS_INFO("joint3 new frequency is: %f", feq_cmd_msg.data);
	jnt2_feq = feq_cmd_msg.data;
}


int main( int argc, char **argv )
{
	ros::init(argc, argv, "simulator_controllor");                                                        /* name the node */
	ros::NodeHandle nh;                                                                                     /* create a node handle */
	ros::Duration half_sec(0.5);                                                                          /* wait 0.5s for service */


	/* make sure service is available before attempting to proceed, else node will crash */
	bool service_ready = false;
	while (!service_ready)                                                                                /* keep trying to find the service */
	{
		service_ready = ros::service::exists("/gazebo/apply_joint_effort", true);                     /* check apply service availablility */
		ROS_INFO("waiting for apply_joint_effort service");
		half_sec.sleep();                                                                               /* retry after 0.5s */
	}
	ROS_INFO("apply_joint_effort service exists");

	ros::ServiceClient set_trq_client =
		nh.serviceClient<gazebo_msgs::ApplyJointEffort>("/gazebo/apply_joint_effort");                /* create client to apply our result */

	service_ready = false;
	while (!service_ready)                                                                                /* keep trying to find the service */
	{
		service_ready = ros::service::exists("/gazebo/get_joint_properties", true);                   /* check property service availablility */
		ROS_INFO("waiting for /gazebo/get_joint_properties service");
		half_sec.sleep();                                                                               /* retry after 0.5s */
	}
	ROS_INFO("/gazebo/get_joint_properties service exists");

	ros::ServiceClient get_jnt_state_client =
		nh.serviceClient<gazebo_msgs::GetJointProperties>("/gazebo/get_joint_properties");            /* create client to get joint state, get feedback of our control */

	gazebo_msgs::ApplyJointEffort	effort_cmd_srv_msg;                                                     /* message to apply control output to joint1 */
	gazebo_msgs::GetJointProperties get_joint_state_srv_msg;                                                /* message that used for get current position and speed for joint1 */
	gazebo_msgs::ApplyJointEffort	effort_cmd_srv_msg2;                                                    /* same as joint3 */
	gazebo_msgs::GetJointProperties get_joint_state_srv_msg2;

	ros::Publisher joint_state_publisher = nh.advertise<sensor_msgs::JointState>("joint_states", 1);      /* publish joint state to joint_state_publisher, so that we can have model on rviz */

	ros::Subscriber jnt1_amp_subscriber = nh.subscribe("jnt1_amp_cmd", 1, jnt1_ampCmdCB);             /* update amplitude for joint1 */
	ros::Subscriber jnt1_feq_subscriber = nh.subscribe("jnt1_feq_cmd", 1, jnt1_feqCmdCB);             /* update frequency for joint1 */
	ros::Subscriber jnt2_amp_subscriber = nh.subscribe("jnt2_amp_cmd", 1, jnt2_ampCmdCB);             /* update amplitude for joint3 */
	ros::Subscriber jnt2_feq_subscriber = nh.subscribe("jnt2_feq_cmd", 1, jnt2_feqCmdCB);             /* update frequency for joint3 */

	sensor_msgs::JointState joint_state_msg;                                                                /* joint1 state for joint_state_publisher */
	sensor_msgs::JointState joint_state_msg2;                                                               /* joint3 ... */

	double	q1, q1dot, q2, q2dot;																			/* joint position and velocity */

	ros::Duration duration(1 / CONTROL_SPEED);                                                            /* duration for each message */
	ros::Rate rate_timer(CONTROL_SPEED);                                                                  /* span of one control cycle */


	effort_cmd_srv_msg.request.joint_name = "joint1";                                                     /* joint name */
	effort_cmd_srv_msg.request.effort = 0.0;                                                          /* the control output start with 0 */
	effort_cmd_srv_msg.request.duration = duration;                                                     /* duration for each control output is 0.01s */

	effort_cmd_srv_msg2.request.joint_name = "joint3";                                                     /* same for joint3 ... */
	effort_cmd_srv_msg2.request.effort = 0.0;
	effort_cmd_srv_msg2.request.duration = duration;

	get_joint_state_srv_msg.request.joint_name = "joint1";                                             /* inquire state of joint1 */
	get_joint_state_srv_msg2.request.joint_name = "joint3";                                             /* ...				joint3 */
																										/* double q1_des = 1.0; */
	double	q1_err, q2_err;																				/*error for joint1 and joint3*/
	double	Kp = 10.0;                                                                                 /* factor of error */
	double	Kv = 3;                                                                                    /* amplify velocity */
	double	trq_cmd;                                                                                        /* effort output */
	double	jnt1_cnt = 0, jnt2_cnt = 0;                                                                     /* point counter of joint1 and joint3 */
	double	jnt1_cmd, jnt2_cmd;                                                                                        /* joint desired position */

	/*
	 * set up the joint_state_msg fields to define a single joint,
	 * called joint1, and initial position and vel values of 0
	 */
	 /* message that publish current position of joint1 and joint3 to robot_state_publisher so that it can give tf to rviz to know and display where our two joint is */
	joint_state_msg.header.stamp = ros::Time::now();                                                        /* fill the header */
	joint_state_msg.name.push_back("joint1");                                                             /* joint name */
	joint_state_msg.position.push_back(0.0);                                                              /* initial position */
	joint_state_msg.velocity.push_back(0.0);                                                              /* initial velocity */

	joint_state_msg2.header.stamp = ros::Time::now();                                                       /* same for joint3 */
	joint_state_msg2.name.push_back("joint3");
	joint_state_msg2.position.push_back(0.0);
	joint_state_msg2.velocity.push_back(0.0);
	while (ros::ok())
	{
		if ( jnt1_cnt++ >= (CONTROL_SPEED / jnt1_feq) )	/* increase counter and see if the numebr of points is enough for one wave */
		{
			jnt1_cnt = 0;			/* clear counter */
		}
		jnt1_cmd = jnt1_amp * (std::sin( ( (M_PI * 2) / (CONTROL_SPEED / jnt1_feq) ) * jnt1_cnt ) );/* calculate value of single point in the wave */

		if ( jnt2_cnt++ >= (CONTROL_SPEED / jnt2_feq) )	/*same for joint3*/
		{
			jnt2_cnt = 0;
		}
		jnt2_cmd = jnt2_amp * (std::sin( ( (M_PI * 2) / (CONTROL_SPEED / jnt2_feq) ) * jnt2_cnt ) );

		get_jnt_state_client.call( get_joint_state_srv_msg );/* get joint1 state */
		q1 = get_joint_state_srv_msg.response.position[0];
		q1dot = get_joint_state_srv_msg.response.rate[0];

		joint_state_msg.header.stamp	= ros::Time::now();/* fill the message */
		joint_state_msg.position[0]	= q1;
		joint_state_msg.velocity[0]	= q1dot;

		joint_state_publisher.publish( joint_state_msg );/* publish this state to robot_state_publisher */

		q1_err = jnt1_cmd - q1;	/* calculate control error */
		if ( q1_err > M_PI )	 /* if desired position is at the front */
		{
			q1_err -= 2 * M_PI;	/*go front*/
		}
		if ( q1_err < -M_PI )	/* or back ... */
		{
			q1_err += 2 * M_PI;
		}

		trq_cmd = Kp * (q1_err) - Kv * q1dot;	/* calculate control output */

		/* send torque command to Gazebo */
		effort_cmd_srv_msg.request.effort = trq_cmd;
		set_trq_client.call( effort_cmd_srv_msg );	/* tell gazebo our new control signal */
		/* make sure service call was successful */
		bool result1 = effort_cmd_srv_msg.response.success;
		if ( !result1 )
			ROS_WARN( "service call to apply_joint_effort failed!" );	/* if call not done */

		/* all the process is exactly the same for joint3 */
		get_jnt_state_client.call( get_joint_state_srv_msg2 );
		q2 = get_joint_state_srv_msg2.response.position[0];

		q2dot = get_joint_state_srv_msg2.response.rate[0];

		joint_state_msg2.header.stamp	= ros::Time::now();
		joint_state_msg2.position[0]	= q2;
		joint_state_msg2.velocity[0]	= q2dot;

		joint_state_publisher.publish( joint_state_msg2 );

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

		/* send torque command to Gazebo */
		effort_cmd_srv_msg2.request.effort = trq_cmd;
		set_trq_client.call( effort_cmd_srv_msg2 );
		/* make sure service call was successful */
		bool result2 = effort_cmd_srv_msg2.response.success;
		if ( !result2 )
			ROS_WARN( "service call to apply_joint_effort failed!" );

		ros::spinOnce();        /* wait for callback */
		rate_timer.sleep();     /* sleep for 0.01s and start another sycle */
	}
	return(0);
}


