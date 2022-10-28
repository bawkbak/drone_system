#!/bin/bash
BASEDIR=$(pwd)

# drone_system
git checkout master

# apriltag_ros
cd $BASEDIR/catkin_ws/src/apriltag_ros
git checkout master

# behavior_tree
cd $BASEDIR/catkin_ws/src/behavior_tree
git checkout master

# behavior_tree_extra
cd $BASEDIR/catkin_ws/src/behavior_tree_extra
git checkout master

# behavior_tree_msgs
cd $BASEDIR/catkin_ws/src/behavior_tree_msgs
git checkout master

# drone_location_transfer
cd $BASEDIR/catkin_ws/src/drone_location_transfer
git checkout master

# drone_state_estimation
cd $BASEDIR/catkin_ws/src/drone_state_estimation
git checkout master

# drone_navigation
cd $BASEDIR/catkin_ws/src/drone_navigation
git checkout master

# drone_resilient_height
cd $BASEDIR/catkin_ws/src/drone_resilient_height
git checkout master

# drone_setup
cd $BASEDIR/catkin_ws/src/drone_setup
git checkout master

# pozyx_ros
cd $BASEDIR/catkin_ws/src/pozyx_ros
git checkout main

# realsense_ros
cd $BASEDIR/catkin_ws/src/realsense_ros
git checkout development

# zed-ros-wrapper
cd $BASEDIR/catkin_ws/src/zed-ros-wrapper
git checkout master

cd $BASEDIR



