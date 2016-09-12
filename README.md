# QT Creator in Docker container
I wanted to put QT Creator Integrated Development ENvironment (IDE) into a docker container.

## Motivation:
1. If I want new team members to setup their development environment quickly they are welcome to use it.
2. If i need to work at someone elses computer I can just pull/build/run my QT Creator container and I can 
write code using the tools setup like I want them to be. Think pair programming. 
3. If I change my primary development computer then I have a container to pull & run.
4. If I screw up my environment I can just rerun my container.

## Notes:

Dockerfile - this file installs all the packages and downloads the QT Creator & QT SDK installation app.

qtcreator_build.sh - this shell script builds the base image from the Dockerfile and after running the QT installer 
commits the changes to a new Docker image. That new Docker image is run by docker_qtcreator.sh script. 

docker_qtcreator.sh - this runs the docker container to start QT Creator. It assumes that user is 
rochford, and home is /home/rochford. 

Unless you have the same ubuntu username as me (rochford), you will need to alter the 3 files. Use the linux command 'id' to 
find out the values.

