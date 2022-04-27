FROM ros:noetic-ros-base

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ros-noetic-rtabmap-ros

WORKDIR /home/catkin_ws