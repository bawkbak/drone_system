FROM stereolabs/zed:3.7-tools-devel-l4t-r32.7
############################ USER ###############################


# setup environment
ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/bin/bash \
    USER=bawkbak \
    NB_UID=1000 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV ROS_DISTRO melodic
ENV HOME=/home/${USER}


###################################### basic tools #####################################

RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
    && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    locales \
    cmake \
    make \
    git \
    vim \
    gedit \
    wget \
    curl \
    sudo \
    unzip \
    lsb-release \
    build-essential \
    net-tools \
    dirmngr \
    gnupg2 \
    mercurial \
    iputils-ping \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    libpcap-dev \
    libpython3-dev \
    libhidapi-dev \
    libopencv-dev \
    libopencv-viz-dev \
    libhidapi-libusb0 \
    python-gobject \
    python-tk \
    python3-pip \
    python3-setuptools \
    python3-opencv \
    python3-numpy \
    python3-empy  \
    byobu \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

###################################### ROS #####################################

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# install bootstrap tools
RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -o Acquire::ForceIPv4=true install --no-install-recommends -y \
    ros-$ROS_DISTRO-desktop-full \
    ros-$ROS_DISTRO-ddynamic-reconfigure \
    ros-$ROS_DISTRO-tf2* \
    ros-$ROS_DISTRO-teleop-twist-joy* \
    ros-$ROS_DISTRO-rosserial \
    ros-$ROS_DISTRO-rosserial-arduino \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    && rm -rf /var/lib/apt/lists/*
##################################### PIP ######################################
RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
    && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    python-pip 
RUN pip install --upgrade pip setuptools

RUN pip install -U \
    rospkg \
    catkin-tools \
    matplotlib \
    pandas \
    gdown \
    argcomplete

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
# RUN pip3 install -U \
#     wrapt \
#     python-tsp \
#     toml
##################################### setting ###################################################
# RUN chown -R ${USER}:${USER} ${HOME}/
RUN echo "${USER} ALL=(ALL)  ALL" >> /etc/sudoers

# Support of nvidia-docker 2.0
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=alli

WORKDIR ${HOME}