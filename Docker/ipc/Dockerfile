FROM argnctu/duckiepond:ipc

# setup environment
ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/bin/bash \
    USER=argduckiepond \
    NB_UID=1000 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV ROS_DISTRO melodic
ENV HOME=/home/${USER}

RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
RUN chmod +x install_geographiclib_datasets.sh
RUN sudo ./install_geographiclib_datasets.sh


RUN echo "${USER} ALL=(ALL)  ALL" >> /etc/sudoers