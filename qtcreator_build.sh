# Build base image
docker build -t qt:base .

# N.B. This is an important step any time you're running GUIs in containers
xhost local:root

# Run installation wizard, save to new image, delete left over container
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v /dev/shm:/dev/shm --device /dev/dri --name qt_install --entrypoint /qt-unified-linux-x64-online.run qt:base
docker commit qt_install qt:latest
docker rm qt_install

# Then you can run QtCreator with this monster of a command
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v /dev/shm:/dev/shm -v /home/rochford:/home/rochford --device /dev/dri --name qt_creator --rm -u rochford --entrypoint /opt/Qt/Tools/QtCreator/bin/qtcreator qt:latest
