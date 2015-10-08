#include <cmath>
#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <actionlib/server/simple_action_server.h>
#include <my_commander/commandAction.h>

#define CONTROL_SPEED   1000.0    //this represent how much dot will appears on rqt_graph in 1 second, also controls how fast this program runs, slow down will save your CPU resource and reduce the jetter of plot (this happens because rqt_graph cannot handle all dots in real time due to lack of CPU resource), but reduce the limitation of max frequency



class commandServer{
private:
    
	ros::NodeHandle nh_;  // we'll need a node handle; get one upon instantiation
	actionlib::SimpleActionServer<my_commander::commandAction> as_;
    
	// here are some message types to communicate with our client(s)
	my_commander::commandGoal goal_; // goal message, received from client
	my_commander::commandResult result_; // put results here, to be sent back to the client when done w/ goal
	my_commander::commandFeedback feedback_; // send feedback via this to client;
	// would need to use: as_.publishFeedback(feedback_); to send incremental feedback to the client
    
public:
	
	double amp;						//amplitude value
	double feq;						//frequency value
	unsigned int cycle;				//number of cycles to run
	bool infi;						//is loop forever?
	std_msgs::Float64 g_vel_cmd;	//message buffer to send out
	
	commandServer();				//define the body of the constructor outside of class definition
    
~commandServer(void) {}
    // Action Interface
void executeCB(const actionlib::SimpleActionServer<my_commander::commandAction>::GoalConstPtr& goal);
};

commandServer::commandServer() :
as_(nh_, "command_action", boost::bind(&commandServer::executeCB, this, _1),false) 
//  clients will need to refer to this name to connect with this server
{
	as_.start(); //start the server running
}
void commandServer::executeCB(const actionlib::SimpleActionServer<my_commander::commandAction>::GoalConstPtr& goal) {
	amp = goal->amplitude;		//get new amplitude, frequency and cycles
	feq = goal->frequency;
	cycle = goal->cycles;
	result_.total_cycle = 0;	//reset cycle counter
	if (cycle == 0)	//cycle = 0 means infinite loop;
		infi = true;
	else
		infi = false;
	ros::Rate naptime(CONTROL_SPEED); //make the output value change by 1ms
	ros::Publisher my_publisher_object = nh_.advertise<std_msgs::Float64>("vel_cmd", 1); //publish the output value to the topic "vel_cmd"
	int time = (int)(CONTROL_SPEED / feq);	//calculate the times(number of ms) of value changes during a single wave
	while ((ros::ok()) && ((cycle--) > 0 || infi == true) ) { //if infi is true, keep running, if infi is not true, while condition becomes: cycle-- > 0, cycle reduce by 1, runs when cycle - 1 > 0
		result_.total_cycle++;	//counter increase 1
        for (int count = 0; count < time ; count++)
		{	//single wave
			naptime.sleep();    //wait for 1ms
			if (!as_.isPreemptRequested()){	//check cancel request
				//go on
				g_vel_cmd.data = amp * (std::sin(((M_PI * 2) / (CONTROL_SPEED / feq)) * count));	//calculate the current angle (rad), π×2 is one circle, do sin, and amplify it
				my_publisher_object.publish(g_vel_cmd); //publish new vel_cmd
				feedback_.cmd_out = g_vel_cmd.data;	//perpare feedback and publish it
				as_.publishFeedback(feedback_);
            } else{
				//stop
				g_vel_cmd.data = 0.0;
				my_publisher_object.publish(g_vel_cmd);
				feedback_.cmd_out = g_vel_cmd.data;
				as_.publishFeedback(feedback_);
				as_.setAborted(result_); // tell the client we have given up on this goal
				return;	//terminate current fucntion
			}
		}
	}
	g_vel_cmd.data = 0.0;
	my_publisher_object.publish(g_vel_cmd);
	feedback_.cmd_out = g_vel_cmd.data;
	as_.publishFeedback(feedback_);
	as_.setSucceeded(result_);	//goal success
}


int main(int argc, char **argv) {
	ros::init(argc, argv, "action_commander"); //name this node
	// when this compiled code is run, ROS will recognize it as a node called "minimal_commander"
	commandServer executor;
	ros::spin(); //normally, can simply do: ros::spin();
	return 0; // should never get here, unless roscore dies
}
