cmake_minimum_required(VERSION 2.8.3)
project(maze_solver)

find_package(catkin_simple REQUIRED)

#uncomment next line to use OpenCV library
#find_package(OpenCV REQUIRED)

#uncomment the next line to use the point-cloud library
#find_package(PCL 1.7 REQUIRED)

#uncomment the following 4 lines to use the Eigen library
find_package(cmake_modules REQUIRED)
#find_package(Eigen3 REQUIRED)
#include_directories(${EIGEN3_INCLUDE_DIR})
#add_definitions(${EIGEN_DEFINITIONS})

catkin_simple()

# example boost usage
# find_package(Boost REQUIRED COMPONENTS system thread)

find_package(example_ros_service REQUIRED)

# C++0x support - not quite the same as final C++11!
# use carefully;  can interfere with point-cloud library
 SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

# Libraries: uncomment the following and edit arguments to create a new library
# cs_add_library(my_lib src/my_lib.cpp)   

# Executables: uncomment the following and edit arguments to compile new nodes
# may add more of these lines for more nodes from the same package
 cs_add_executable(openloop_solver src/openloop_solver.cpp)
 cs_add_executable(feedback_solver src/feedback_solver.cpp)
 cs_add_executable(lidar_detector src/lidar_detector.cpp)
 cs_add_executable(solver_client src/solver_client.cpp)
 cs_add_executable(solver_server src/solver_server.cpp)

add_dependencies(solver_client ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS} example_ros_service)
add_dependencies(solver_server ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS} example_ros_service)
#the following is required, if desire to link a node in this package with a library created in this same package
# edit the arguments to reference the named node and named library within this package
# target_link_library(example my_lib)

cs_install()
cs_export()
    
