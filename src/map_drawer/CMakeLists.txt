cmake_minimum_required(VERSION 2.8.3)
project(map_drawer)

find_package(catkin_simple REQUIRED)

#uncomment next line to use OpenCV library
#find_package(OpenCV REQUIRED)

#uncomment the next line to use the point-cloud library
#find_package(PCL 1.7 REQUIRED)

#uncomment the following 4 lines to use the Eigen library
#find_package(cmake_modules REQUIRED)
#find_package(Eigen3 REQUIRED)
#include_directories(${EIGEN3_INCLUDE_DIR})
#add_definitions(${EIGEN_DEFINITIONS})

catkin_simple()

# example boost usage
find_package(Boost REQUIRED COMPONENTS system thread)

# C++0x support - not quite the same as final C++11!
# use carefully;  can interfere with point-cloud library
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

# Libraries: uncomment the following and edit arguments to create a new library
cs_add_library(trajectory_builder src/traj_builder.cpp)
cs_add_library(mobot_lib src/mobot_general.cpp)

# Executables: uncomment the following and edit arguments to compile new nodes
# may add more of these lines for more nodes from the same package
cs_add_executable(trajectory_publisher src/pub_des_state_main.cpp src/pub_des_state.cpp)
cs_add_executable(openloop_controllor src/open_loop_controller.cpp)
cs_add_executable(linear_controllor src/lin_steering_wrt_odom.cpp)
cs_add_executable(nonlinear_controllor src/mobot_nl_steering.cpp)
cs_add_executable(append_path src/append_path_client.cpp)
cs_add_executable(range_sensor src/lidar_detector.cpp)
cs_add_executable(map_drawer src/slam_gmapping.cpp src/mapping.cpp)
cs_add_executable(wide_dir_follower src/feedback_controllor.cpp)

#the following is required, if desire to link a node in this package with a library created in this same package
# edit the arguments to reference the named node and named library within this package
target_link_libraries(trajectory_publisher  trajectory_builder)

cs_install()
cs_export()
    
