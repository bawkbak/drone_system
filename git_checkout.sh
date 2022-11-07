#!/bin/bash
BASEDIR=$(pwd)

# drone_system
echo -e "-----------\ndrone_system\n V V V V V"
git checkout master

# apriltag_ros
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\napriltag_ros\n V V V V V"
cd $BASEDIR/catkin_ws/src/apriltag_ros
git checkout master

# behavior_tree
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\nbehavior_tree\n V V V V V"
cd $BASEDIR/catkin_ws/src/behavior_tree
git checkout master

# behavior_tree_extra
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\nbehavior_tree_extra\n V V V V V"
cd $BASEDIR/catkin_ws/src/behavior_tree_extra
git checkout master

# behavior_tree_msgs
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\nbehavior_tree_msgs\n V V V V V"
cd $BASEDIR/catkin_ws/src/behavior_tree_msgs
git checkout master

# drone_location_transfer
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\ndrone_location_transfer\n V V V V V"
cd $BASEDIR/catkin_ws/src/drone_location_transfer
git checkout master

# drone_state_estimation
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\ndrone_state_estimation\n V V V V V"
cd $BASEDIR/catkin_ws/src/drone_state_estimation
git checkout master

# drone_mavros_cmd
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\ndrone_mavros_cmd\n V V V V V"
cd $BASEDIR/catkin_ws/src/drone_mavros_cmd
git checkout master

# drone_navigation
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\ndrone_navigation\n V V V V V"
cd $BASEDIR/catkin_ws/src/drone_navigation
git checkout master

# drone_resilient_height
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\ndrone_resilient_height\n V V V V V"
cd $BASEDIR/catkin_ws/src/drone_resilient_height
git checkout master

# drone_setup
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\ndrone_setup\n V V V V V"
cd $BASEDIR/catkin_ws/src/drone_setup
git checkout master

# pozyx_ros
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\npozyx_ros\n V V V V V"
cd $BASEDIR/catkin_ws/src/pozyx_ros
git checkout main

# realsense_ros
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\nrealsense_ros\n V V V V V"
cd $BASEDIR/catkin_ws/src/realsense_ros
git checkout development

# zed-ros-wrapper
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\nzed-ros-wrapper\n V V V V V"
cd $BASEDIR/catkin_ws/src/zed-ros-wrapper
git checkout master

# drone_perception
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\ndrone_perception\n V V V V V"
cd $BASEDIR/catkin_ws/src/drone_perception
git checkout master

# darknet_ros
echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ\n-----------\ndarknet_ros\n V V V V V"
cd $BASEDIR/catkin_ws/src/darknet_ros
git checkout master

echo -e " Ʌ Ʌ Ʌ Ʌ Ʌ"
cd $BASEDIR



