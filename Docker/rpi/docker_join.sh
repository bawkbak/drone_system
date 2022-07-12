#!/usr/bin/env bash

IMG=bawkbak/robotx2022:drone_rpi

xhost +
containerid=$(docker ps -aqf "ancestor=${IMG}")&& echo $containerid
docker exec -it \
    --privileged \
    -e DISPLAY=${DISPLAY} \
    ${containerid} \
    bash
xhost - 