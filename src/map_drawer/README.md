# map_drawer

This package is build for EECS499 Algorithmic Robotics Project:
An Implementation of Improved Grid SLAM with Rao-Blackwellized Particle Filters

The package depands on openslam_gmapping, so you have to that repositort first
git clone https://github.com/ros-perception/openslam_gmapping

Robot model uses the model of Jinx which is within Professor Newman's learning_ros repository
git clone https://github.com/wsnewman/learning_ros 

This package contains two demos for robot drawing map of the environment, first one is the robot starting in a pen, exectuing a prescribed path that will takes it goes around the pen and then go out. The other one is the robot starting in a maze, it will follows the widest way.

## Code usage
### To run robot drawing mapping of pen
roslaunch map_drawer starting_pen_mapping.launch
### To run robot drawing mapping of maze
roslaunch map_drawer maze_mapping.launch
## Collaborators
Shipei Tian (sxt437)
Yaqi Li(yxl1544)

## Parameters of algorithm
There is some parameters for the mapping node that is specify in the launch file, that you can change it easily and play with:
<param name="map_update_interval" value="0.5"/> indicates the least time interval of each update

If one of the following three parameters meet, the update process will begain:
<param name="temporalUpdate" value="0.5"/> time period of update
<param name="linearUpdate" value="0.25"/> robot's travel distance
<param name="angularUpdate" value="0.15"/> robot's turning angle

<param name="maxRange" value="60.0"/> indicates the maxmium range of the scan
<param name="maxUrange" value="40.0"/> indicates the range that is used for build map

<param name="minimumScore" value="0"/> indicates how perferable to use scan matching result instead of odometry model (likelihood score), lower means perfer scan matching
<param name="iterations" value="5"/> indicates the attempts to perform the scan matching for each particles (don't make it too large)
<param name="lstep" value="0.05"/> indicates the step of travel distance for searching good scan matching result
<param name="astep" value="0.05"/> indicates the step of turning angle for searching good scan matching result

<param name="resampleThreshold" value="0.5"/> indicates the threshold of Neff to perform the resampling
<param name="particles" value="30"/> indicates the number of particle
<param name="delta" value="0.04"/> indicates the resolution of map, the unit is meter

The following parameters specify the initial size of the map (it can be expand automatically)
<param name="xmin" value="-50.0"/>
<param name="ymin" value="-50.0"/>
<param name="xmax" value="50.0"/>
<param name="ymax" value="50.0"/>
Do not change the rest of the parameters, they are for motion and sensor model.
		
		

