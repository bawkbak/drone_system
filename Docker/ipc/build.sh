#!/bin/sh
docker build --rm -t bawkbak/drone:ipc .

# rosrun tf static_transform_publisher name=tracking_camera args=1 1 0 0 0 0  drone_origin map 10 