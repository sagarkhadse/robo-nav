# Microsoft Kinect Setup

This is a guide to setup the Microsoft Kinect v1 camera on ROS Noetic. 
[source](https://aibegins.net/2020/11/22/give-your-next-robot-3d-vision-kinect-v1-with-ros-noetic/)

## Prerequisites

### ROS Packages

- [rgbd-launch](http://wiki.ros.org/rgbd_launch) - Collection of launch file for rgbd processing
  ```zsh
  sudo apt install ros-kinetic-rgbd-launch
  ```
- [tf2-tools](http://wiki.ros.org/tf2_tools) - Frames visualization tool
  ```zsh
  sudo apt-get install ros-noetic-tf2-tools  
  ```

## Installation

### libfreenect [ [Github](https://github.com/OpenKinect/libfreenect) | [Wiki](https://openkinect.org/wiki/Main_Page) ]

libfreenect is an open-source driver for Microsoft Kinect. It supports accessing the following from the sensor,

- RGB Image
- Depth Image
- Audio
- Motor
- LED
- Accelerometer

To install freenect on ubuntu,

```zsh
sudo apt-get install freenect
```

> **Note:** For other operating systems follow the guides [here](https://openkinect.org/wiki/Getting_Started). libfreenect works only with the Kinect v1, for v2 look at [libfreenect2](https://github.com/OpenKinect/libfreenect2).

### freenect_stack [ [Github](https://github.com/ros-drivers/freenect_stack) | [Wiki](http://wiki.ros.org/freenect_stack) ]

ROS package for libfreenect. 

To use freenect_stack, add it to your catkin workspace,

```zsh
cd ~/catkin_workspace/src
git clone https://github.com/ros-drivers/freenect_stack.git
cd ..
catkin_make
```

## Testing

1. Source the setup file from your workspace,
   ```zsh
   source ~/catkin_ws/devel/setup.sh
   ```
2. Launch the freenect node,
   ```zsh
   roslaunch freenect_launch freenect.launch depth_registration:=true
   ```
3. Visualize using `rviz` by setting the fixed frame to `camera_link` and adding a `pointcloud2` with topic `/camera/depth_registered/points`

> The reference guide can be found [here]().
