# Stage 1: build base image with prequisite packages
FROM arm32v7/ubuntu:18.04

LABEL maintainer="tuanlm@greenglobal.vn"

############################ USER ###############################
# setup environment
ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/bin/bash \
    USER=argduckiepond \
    NB_UID=1000 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ENV HOME=/home/${USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${USER}

RUN echo "root:root" | chpasswd
RUN echo "${USER}:111111" | chpasswd


# Install necessary packages for the installer
RUN apt-get update -y 
RUN apt-get install update-manager-core -y

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y --allow-unauthenticated \
    apt-utils lsb-release build-essential apt-transport-https \
    usbutils unzip coreutils curl git sed sudo tar udev wget vim \
    automake cmake make libusb-1.0-0-dev libatlas-base-dev \
    libopenblas-dev libprotobuf-dev libleveldb-dev libsnappy-dev \
    libopencv-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev \
    liblmdb-dev libxslt-dev libxml2-dev libgraphviz-dev protobuf-compiler \
    byacc swig3.0 graphviz gfortran python-dev python-numpy python-pip python3 \
    python3-dev python3-numpy python3-scipy python3-yaml python3-nose python3-tk python3-pip 

# Do clean jobs
RUN sudo apt-get clean && rm -rf /var/lib/apt/lists/*

# setup ROS sources
RUN apt-key adv \
    --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv-keys F42ED6FBAB17C654
RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" >> /etc/apt/sources.list

ENV ROS_DISTRO melodic
RUN apt-get update && apt-get install -y \ 
    ros-$ROS_DISTRO-rosserial-arduino \
    ros-$ROS_DISTRO-rosserial \
    ros-$ROS_DISTRO-geodesy \
    ros-$ROS_DISTRO-dynamic-reconfigure \
    ros-$ROS_DISTRO-cv-bridge \
    ros-$ROS_DISTRO-nav-msgs \
    ros-$ROS_DISTRO-pcl-conversions \
    ros-$ROS_DISTRO-pcl-ros \
    ros-$ROS_DISTRO-joystick-drivers \
    ros-$ROS_DISTRO-image-transport \
    ros-$ROS_DISTRO-usb-cam \
    ros-$ROS_DISTRO-angles \
    ros-$ROS_DISTRO-tf2-geometry-msgs \
    ros-$ROS_DISTRO-eigen-conversions \
    ros-$ROS_DISTRO-navigation 

RUN pip2 install scipy

RUN sudo -H pip3 install --upgrade pip 
 
RUN sudo -H pip3 install \
    utm \
    Cython \
    paho-mqtt \
    pytest \
    rospkg \
    argparse \
    catkin-tools\
    pypozyx \
    empy \
    pyyaml \
    digi-xbee \
    gdown 


#install rpi gui
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    xserver-xorg xinit

RUN apt-get install -y\
    mate-desktop-environment-core\
    lightdm tightvncserver\
    && rm -rf /var/lib/apt/lists/*

##################################### Drone ######################################
RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
    && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    ros-$ROS_DISTRO-mavros \
    ros-$ROS_DISTRO-mavros-extras \
    libpcl1 \
    ros-$ROS_DISTRO-octomap-* \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    libgstreamer-plugins-base1.0-dev \
    geographiclib-tools \
    libgeographic-dev \
    libpcl1 \
    ros-$ROS_DISTRO-octomap-* \
    ros-$ROS_DISTRO-stereo-image-proc \
    ros-$ROS_DISTRO-image-view

RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
RUN chmod +x install_geographiclib_datasets.sh
RUN sudo ./install_geographiclib_datasets.sh
RUN pip install --user toml   


##################################### setting #####################################
RUN chown -R ${USER}:${USER} ${HOME}/
RUN echo "${USER} ALL=(ALL)  ALL" > /etc/sudoers
RUN usermod -aG video argduckiepond

# setup entrypoint

USER ${USER}

WORKDIR ${HOME}
CMD ["bash"]