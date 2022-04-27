#!/bin/bash

source /opt/ros/noetic/setup.bash

cd /home/catkin_ws && catkin_make
source /home/catkin_ws/devel/setup.bash

roslaunch robo_nav robo_nav.launch sim:=true localize:=true