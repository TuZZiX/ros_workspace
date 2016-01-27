# maze_solver

## To run

`roslaunch stdr_launchers server_with_map_and_gui_plus_robot.launch`

`rosrun maze_solver maze_solver`

## Reuseable

There is a class called *RobotCommander* which could use for command example robot in stdr, with two member function:

void move(int direction, double time)	// direction could be FORWARD or BACKWARD
    
void turn(int direction, double time)	// direction could be LEFT or RIGHT