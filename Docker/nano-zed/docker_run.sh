#!/usr/bin/env bash

ARGS=("$@")

# Make sure processes in the container can connect to the x server
# Necessary so gazebo can create a context for OpenGL rendering (even headless)
XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]; then
    xauth_list=$(xauth nlist $DISPLAY)
    xauth_list=$(sed -e 's/^..../ffff/' <<<"$xauth_list")
    if [ ! -z "$xauth_list" ]; then
        echo "$xauth_list" | xauth -f $XAUTH nmerge -
   else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi


#Prevent executing "docker run" when xauth failed.
if [ ! -f $XAUTH ]; then
    echo "[$XAUTH] was not properly created. Exiting..."
   exit 1
fi
# argnctu/robotx2022:nano-zedm-d435
# bawkbak/robotx2022:drone_nano
docker run -it \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=$XAUTH \
    -v "$XAUTH:$XAUTH" \
    -v "/home/$USER/drone_system:/home/robotx/drone_system" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix" \
    -v "/etc/localtime:/etc/localtime:ro" \
    -v "/home/$USER/drone_system/zed_settings/:/usr/local/zed/settings/" \
    -v "/dev:/dev" \
    --workdir "/home/robotx/drone_system" \
    --user "root:root" \
    --name robotx \
    --network host \
    --gpus all \
    --rm \
    --privileged \
    bawkbak/robotx2022:drone_nano_py \
    bash 

