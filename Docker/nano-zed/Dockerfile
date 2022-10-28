FROM stereolabs/zed:3.8-tools-devel-l4t-r32.7
############################ USER ###############################

# setup environment
ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/bin/bash \
    USER=robotx \
    NB_UID=1000 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV ROS_DISTRO melodic
ENV HOME=/home/${USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${USER}

RUN echo "root:root" | chpasswd
RUN echo "${USER}:111111" | chpasswd


RUN apt-get update
RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
    && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    locales \
    cmake \
    make \
    git \
    vim \
    alsa \ 
    libasound2-dev \
    gedit \
    wget \
    sudo \
    lsb-release \
    build-essential \
    net-tools \
    ruby \
    dirmngr \
    gnupg2 \
    mercurial \
    gtk+-3.0 \
    gfortran \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    libpcap-dev \
    libusb-1.0 \
    tzdata \
    libglfw3-dev \
    libmetis-dev \
    python-gtk2 \
    python-gobject \
    python-tk \
    python3-pip \
    python3-opencv  \
    python3-numpy \
    python3-empy  \
    python3-scipy   \
    python3-setuptools \
    python3-dev \
    python3-yaml \
    libfltk1.3-dev \ 
    freeglut3-dev \ 
    libpng-dev \ 
    libjpeg-dev \
    libxft-dev \ 
    libxinerama-dev \ 
    libtiff5-dev \ 
    netbase \ 
    fluid \ 
    xterm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

###################################### ROS #####################################

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list \
    && echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list

# setup keys
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
    && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -o Acquire::ForceIPv4=true install --no-install-recommends -y \
    ros-${ROS_DISTRO}-desktop-full \
    ros-$ROS_DISTRO-mavros \
    ros-$ROS_DISTRO-mavros-extras \
    ros-$ROS_DISTRO-octomap-* \
    ros-$ROS_DISTRO-serial \
    ros-$ROS_DISTRO-soem \
    ros-$ROS_DISTRO-openslam-gmapping \
    ros-$ROS_DISTRO-geodesy \
    ros-$ROS_DISTRO-cartographer-* \
    ros-$ROS_DISTRO-cartographer-ros \
    ros-$ROS_DISTRO-cartographer-rviz \
    ros-$ROS_DISTRO-ddynamic-reconfigure \
    ros-$ROS_DISTRO-perception \
    ros-$ROS_DISTRO-rgbd-launch \
    ros-$ROS_DISTRO-joystick-drivers \
    ros-$ROS_DISTRO-pointcloud-to-laserscan \
    ros-$ROS_DISTRO-robot-localization \
    ros-$ROS_DISTRO-spacenav-node \
    ros-$ROS_DISTRO-tf2-sensor-msgs \
    ros-$ROS_DISTRO-controller-manager \
    ros-$ROS_DISTRO-twist-mux \
    ros-$ROS_DISTRO-velodyne-simulator \
    ros-$ROS_DISTRO-gazebo-ros \
    ros-$ROS_DISTRO-move-base-msgs \
    ros-$ROS_DISTRO-hector-gazebo \
    ros-$ROS_DISTRO-hector-trajectory-server \
    ros-$ROS_DISTRO-lms1xx \
    ros-$ROS_DISTRO-rviz-imu-plugin \
    ros-$ROS_DISTRO-interactive-marker-twist-server \
    ros-$ROS_DISTRO-teleop-twist-joy \
    ros-$ROS_DISTRO-rosserial-arduino \
    ros-$ROS_DISTRO-rosserial \
    ros-$ROS_DISTRO-cv-bridge \
    ros-$ROS_DISTRO-rosbridge-server \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
  
RUN wget http://packages.ros.org/ros.key -O - | apt-key add -

RUN apt-get update \
    && apt-get -yq install python3-catkin-tools 
RUN apt update -y \
    && apt install build-essential git -y
##################################### PIP3 ######################################

RUN pip3 install --upgrade pip setuptools

RUN pip3 install \
    numpy==1.19.4 \
    rospkg \
    catkin-tools\
    cython \
    Cython \
    pandas \
    image \
    Pillow \
    pandas \
    pypozyx \
    empy \
    gdown 

#################################### Pytorch ####################################
RUN apt-get update -y 

RUN apt-get install -y \
    libopenblas-base \
    libopenmpi-dev \
    libomp-dev   

RUN wget https://nvidia.box.com/shared/static/9eptse6jyly1ggt9axbja2yrmj6pbarc.whl -O \
    torch-1.6.0-cp36-cp36m-linux_aarch64.whl \
    && pip3 install torch-1.6.0-cp36-cp36m-linux_aarch64.whl torchvision \
    && rm -rf  torch-1.6.0-cp36-cp36m-linux_aarch64.whl 

##################################### PIP2 ######################################
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py \
    && python2 get-pip.py

RUN pip2 install --upgrade pip setuptools

RUN pip2 install \
    scipy

RUN rosdep init \ 
    && rosdep update

################################ mavros gps imu ################################
RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
RUN chmod +x install_geographiclib_datasets.sh
RUN sudo ./install_geographiclib_datasets.sh

#################################  procman  ########################################

RUN cd ${HOME} && git clone https://github.com/lcm-proj/lcm \
    && cd lcm \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install

RUN cd ${HOME} && git clone http://github.com/ARG-NCTU/procman \
    && cd procman \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install

######################################## realsense ########################################

COPY libuvc_installation.sh librealsense/scripts/

RUN ./librealsense/scripts/libuvc_installation.sh


######################################## apriltag ########################################

RUN git clone https://github.com/AprilRobotics/apriltag.git \
    && cd apriltag \
    && mkdir build \
    && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make install

######################################## realsense-ros ########################################

RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
    && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    ros-${ROS_DISTRO}-ddynamic-reconfigure \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install pypozyx requests

#################################### BASH ####################################


RUN chown -R $USER:$USERS ${HOME}/
RUN echo "root ALL=(ALL)  ALL" >> /etc/sudoers
