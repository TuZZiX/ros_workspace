#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <robot_simulator/TrajMsgAction.h>
#include <std_msgs/Float64.h>
#include <iostream>
#include <string>
#include <cmath>

using namespace std;

const int		total_joint_number = 3;
const string	joint_name[] = {
	"joint1", "joint2", "joint3"
};

bool isCb = false;				//check done callback

void doneCb(const actionlib::SimpleClientGoalState& gstate, const robot_simulator::TrajMsgResultConstPtr& result) {
	//call when action terminated
	ROS_INFO("trajectory_commander terminated with state [%s]", gstate.toString().c_str());
	isCb = true;	//callback done
}
void activeCb() {
	//call when action start (executeCb been called)
	ROS_INFO("trajectory_commander start running");
	isCb = true;	//callback dones
}
void feedbackCb(const robot_simulator::TrajMsgFeedbackConstPtr& feedback) {
	//real time output from action_commander, uncomment it to display
	//	ROS_INFO("action_commander current output value: %f", feedback->cmd_out);
}

// This function will be called once when the goal completes
// this is optional, but it is a convenient way to get access to the "result" message sent by the server
int main(int argc, char** argv) {
	ros::init(argc, argv, "trajectory_interface"); // name this node 
	robot_simulator::TrajMsgGoal goal; //instantiate a goal message compatible with our server, as defined in this package
	
									   // we will command a limited-duration sinusoidal motion; define amplitude, frequency and duration
	double dt = 0.1;
	const double omega = 1.0; //rad/sec
	const double omega_spin = 2.0; //rad/sec
	const double amplitude = 0.3; //radians
	double start_angle = amplitude;
	double final_phase = M_PI; // radians--two periods
	string mode;
	int times;
	double final_time; //seconds
	double phase = 0.0; //radians        
	double time_from_start = 0.0; // seconds
	double q_des, qdot_des; //radians, radians/sec  

	actionlib::SimpleActionClient<robot_simulator::TrajMsgAction> action_client("trajectory_commander", true);
	// attempt to connect to the server:
	std::cout << "----------------------------------------------" << std::endl;
	std::cout << "Waiting for trajectory_commander for 5s..." << std::endl;
	bool server_exists; // wait for up to 5 seconds
																		  // something odd in above: does not seem to wait for 5 seconds, but returns rapidly if server not running
																		  //bool server_exists = action_client.waitForServer(); //wait forever
	while (ros::ok()) {	//keep trying when failed
		server_exists = action_client.waitForServer(ros::Duration(5.0));	// wait for up to 5 seconds
		if (server_exists)	//if connected
			break;
		ROS_WARN("Could not connect to trajectory_commander, retrying...");	//if not connected
	}
	std::cout << "Connected to trajectory_commander" << std::endl;;  // if here, then we connected to the server;


											 // instantiate and populate a goal message:
	trajectory_msgs::JointTrajectory trajectory; //this contains an array (a vector) of trajectory points
	trajectory_msgs::JointTrajectoryPoint trajectory_point; //here is a single trajectory point, which will be populated and included in the trajectory

															//one specifies the text names of joints in the variable-length array (vector) "joint_names"
															// ROS allows for putting these in any order, and for specifying all or only a subset of joints
															// the current example is not so tolerant--it requires specifying ALL joint command values in a FIXED order
															// but for this simple example, there is only 1 joint anyway
	trajectory.joint_names.push_back(joint_name[0]);
	trajectory.joint_names.push_back(joint_name[1]);
	trajectory.joint_names.push_back(joint_name[2]);
	// repeat the above command for every joint of the robot, in some preferred order
	// joint position commands below must be specified in the same order as specified in the joint_names array
	int njnts = trajectory.joint_names.size(); // we specified this many joints;  need same size for position and velocity vectors
	trajectory_point.positions.resize(njnts);
	trajectory_point.velocities.resize(njnts);

	while (ros::ok()) { //keep runing this
		std::cout << "----------------------------------------------" << std::endl;	//display interface
		std::cout << "What you want this minimal robot to do?" << std::endl;
		std::cout << "You can say: " << std::endl;
		std::cout << "	\"shake\"" << std::endl;
		std::cout << "or	\"nod\"" << std::endl;
		std::cout << "or	\"back\"" << std::endl;
		std::cout << "You pick:";
		std::cin >> mode;													//get value for amplitude and frequency and put it into the goal
		std::cout << "----------------------------------------------" << std::endl;
		std::cout << "How many times you want this action do?" << std::endl;
		std::cin >> times;
		std::cout << "----------------------------------------------" << std::endl;
		final_phase *= times;
		if (mode.compare("spin") == 0)
		{
			for (int count = 0.0; count < times * 20; count++) {	//nearly 20 cycles per circle
				{
					phase += M_PI*omega_spin*dt;			//increase phase
					trajectory_point.positions[0] = 0.0;	//keep vertical
					trajectory_point.velocities[0] = 2;
					trajectory_point.positions[2] = M_PI*0.5;//horizontal
					trajectory_point.velocities[2] = 2;
					if (phase >= M_PI)						//move back
					{
						phase -= 2 * M_PI;
					}
					trajectory_point.positions[1] = phase;
					trajectory_point.velocities[1] = M_PI*omega_spin*dt; // speed of increase
					time_from_start += dt; //cumulative time from start of move
					trajectory_point.time_from_start = ros::Duration(time_from_start);
					trajectory.points.push_back(trajectory_point);
					dt = (rand() % 10 + 1)*0.01;
				}
			}
		}
		if (mode.compare("nod") == 0)
		{
			for (phase = 0.0; phase < final_phase; phase += omega*dt)
			{
				q_des = start_angle + amplitude*sin(phase); //here we make up a desired trajectory shape: q_des(t)
				qdot_des = amplitude*omega*cos(phase); // this is the time derivative of q_des; 
				trajectory_point.positions[0] = q_des; // do this for every joint, from 0 through njnts-1
				trajectory_point.velocities[0] = qdot_des; // and all velocities (in the server example, velocities will get ignored)
				trajectory_point.positions[1] = 0.0; // do this for every joint, from 0 through njnts-1
				trajectory_point.velocities[1] = 2; // and all velocities (in the server example, velocities will get ignored)
				trajectory_point.positions[2] = q_des; // do this for every joint, from 0 through njnts-1
				trajectory_point.velocities[2] = qdot_des; // and all velocities (in the server example, velocities will get ignored)
				time_from_start += dt; //cumulative time from start of move
				//specify arrival time for this point--in ROS "duration" format
				trajectory_point.time_from_start = ros::Duration(time_from_start); //this converts from seconds to ros::Duration data type
																				   //append this trajectory point to the vector of points in trajectory:
				trajectory.points.push_back(trajectory_point);
				//merely for illustration purposes, introduce a random time step; 
				// this shows that trajectory messages do not need a fixed time step
				// also, the dt values can be quite coarse in this example, for the purpose of illustrating the interpolation capability of the server
				dt = (rand() % 10 + 1)*0.01;     // rand() % 100 + 1 in the range 1 to 100, so dt is in the range from 0.01 to 1.0 sec
			}	
		}
		if (mode.compare("back") == 0)
			{
				trajectory_point.positions[0] = 0.0; // back to all zero
				trajectory_point.velocities[0] = 1;	 // at some speed
				trajectory_point.positions[1] = 0.0;
				trajectory_point.velocities[1] = 1;
				trajectory_point.positions[2] = 0.0;
				trajectory_point.velocities[2] = 1;
				trajectory_point.time_from_start = ros::Duration(dt);
				trajectory.points.push_back(trajectory_point);
			}


			goal.trajectory = trajectory;
			action_client.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);		//send message to action_commander, this will makes it start running
			while (!isCb);	//waitting for doneCb
			isCb = false;
			bool finished_before_timeout = action_client.waitForResult(ros::Duration(time_from_start + 5.0));
			if (!finished_before_timeout) {
				ROS_WARN("Giving up waiting on result");
				action_client.cancelGoal();		//terminate this action
			}else{
				ROS_INFO("Goal accomplished!");		//if finished
			}
			while (!isCb);	//waitting for doneCb
			std::cout<<"----------------------------------------------"<<std::endl;
			std::cout<<"Input new parameters to start running again"<<std::endl;	
	}
	return 0; // should never get here, unless roscore dies
}
