cmake_minimum_required(VERSION 2.8.3)
project(my_commander)

find_package(catkin_simple REQUIRED)

catkin_simple()

# Executables
cs_add_executable(minimal_commander src/minimal_commander.cpp)
cs_add_executable(minimal_interface src/minimal_interface.cpp)

cs_install()
cs_export()
    
