#include <iostream>
#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <my_commander/commandAction.h>

bool isCb = false;				//check done callback

void doneCb(const actionlib::SimpleClientGoalState& gstate, const my_commander::commandResultConstPtr& result) {
	//call when action terminated
	ROS_INFO("action_commander has run for %d cycles and terminated with state [%s]", result->total_cycle, gstate.toString().c_str());
	isCb = true;	//callback done
}
void activeCb() {
	//call when action start (executeCb been called)
	ROS_INFO("action_commander start running");
}
void feedbackCb(const my_commander::commandFeedbackConstPtr& feedback) {
	//real time output from action_commander, uncomment it to display
//	ROS_INFO("action_commander current output value: %f", feedback->cmd_out);
}

int main(int argc, char **argv) {
	float timeout;	//timeout time
	bool server_exists, finished_before_timeout;
	ros::init(argc, argv, "action_interface"); //name this node
	actionlib::SimpleActionClient<my_commander::commandAction> commandAct("command_action", true);	//create action
	my_commander::commandGoal goal;	//create message for action_commander
	
	std::cout<<"----------------------------------------------"<<std::endl;
	std::cout<<"Waiting for action_commander for 5s..."<<std::endl;
	while (ros::ok()) {	//keep trying when failed
		server_exists = commandAct.waitForServer(ros::Duration(5.0));	// wait for up to 5 seconds
		if (server_exists)	//if connected
			break;
		ROS_WARN("Could not connect to action_commander, retrying...");	//if not connected
	}
	std::cout<<"Connected to action_commander"<<std::endl;;  // if here, then we connected to the server;
	
	while (ros::ok()) { //keep runing this
		std::cout<<"----------------------------------------------"<<std::endl;
		std::cout<<"Please set new goal amplitude:"<<std::endl;
		std::cin>>goal.amplitude;													//get value for amplitude and frequency and put it into the goal
		std::cout<<"----------------------------------------------"<<std::endl;
		std::cout<<"Please set new goal frequency(Hz):"<<std::endl;
		std::cin>>goal.frequency;
		std::cout<<"----------------------------------------------"<<std::endl;
		std::cout<<"Please set the number of cycles you want to run, 0 = infinite:"<<std::endl;
		std::cin>>goal.cycles;														//get cycles and put it into the goal
		std::cout<<"----------------------------------------------"<<std::endl;
		std::cout<<"Please set the max time(seconds) for these works, 0 = wait forever:"<<std::endl;
		std::cin>>timeout;															//set timeout time
		std::cout<<"----------------------------------------------"<<std::endl;
		commandAct.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);		//send message to action_commander, this will makes it start running
		
		if (timeout == 0)
			finished_before_timeout = commandAct.waitForResult();	// wait forever...
		else
			finished_before_timeout = commandAct.waitForResult(ros::Duration(timeout));	//checking timeout
		
		if (!finished_before_timeout) {
			ROS_WARN("Cycles did not finished before timeout, terminating action_commander...");	//if timeout
			commandAct.cancelGoal();		//terminate this action
		}
		else
		{
			ROS_INFO("Goal accomplished!");		//if finished
		}
		
		while (!isCb);	//waitting for doneCb
		isCb = false;
		std::cout<<"----------------------------------------------"<<std::endl;		//print informations
		std::cout<<"Current state:	Amplitude:	Frequency(Hz):"<<std::endl;
		actionlib::SimpleClientGoalState state = commandAct.getState();				//check state
		std::cout<<state.toString().c_str()<<"		";								//print state
		std::cout<<goal.amplitude<<"		"<<goal.frequency<<std::endl;			//print amplitude and frequency
		std::cout<<"----------------------------------------------"<<std::endl;
		
		std::cout<<"----------------------------------------------"<<std::endl;
		std::cout<<"Input new parameters to start running again"<<std::endl;
    }
    return 0; // should never get here, unless roscore dies
}
