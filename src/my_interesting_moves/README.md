# ROS_Robotics-my_interesting_moves
For documentations, refer html/index.html

There is an example for how to use the library: src/interesting_moves_example.cpp

This repository depands on cwru_baxter (https://github.com/cwru-robotics/cwru_baxter), you have to get cwru_baxter first.

There is an uncommited change to cwru_baxter but it is essential for this package.
Please replace the file in cwru_baxter with the file 

	cwru_baxter/baxter_traj_streamer/src/traj_interpolator_as.cpp

To run the code, run following code in your terminal:

	roslaunch cwru_baxter_sim baxter_world.launch
	roslaunch my_interesting_moves interesting_moves_example.launch


This is a repository for assignment, so the code may not be modified after.
