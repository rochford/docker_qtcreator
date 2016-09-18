FROM ubuntu:14.04
MAINTAINER Tim Rochford "timothy.rochford@gmail.com"

# Install lots of packages
RUN apt-get update
RUN apt-get update && apt-get install -y libxcb-keysyms1-dev libxcb-image0-dev \
    libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev \
    libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev \
    libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev \
    libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev x11vnc \
    xauth build-essential mesa-common-dev libglu1-mesa-dev libxkbcommon-dev \
    libxcb-xkb-dev libxslt1-dev libgstreamer-plugins-base0.10-dev libx11-xcb1 \
    libegl1-mesa \
    wget git cmake

# Add user to image - you will need to change the user name (linux 'id' command)
RUN groupadd -g 1000 rochford
RUN useradd -d /home/rochford -s /bin/bash -m rochford -u 1000 -g 1000

# Download script
RUN wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
RUN chmod +x ./qt-unified-linux-x64-online.run

# Run installer as entrypoint
ENTRYPOINT ./qt-unified-linux-x64-online.run
