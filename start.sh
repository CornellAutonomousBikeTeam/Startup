#!/bin/bash
source /opt/ros/indigo/setup.bash
source /home/pi/ros_ws/install/setup.bash
source /home/pi/ros_ws/devel/setup.bash
echo "RUNNING (configuration file: ${1:-run}.launch)..."
TIME=$(date +"%F")
#~~%I-%M-%S_%p")
BIKEPATH=$(rospack find bike)/bagfiles

# This command starts the ROS nodes found in the provided launch
# config file. If you want a different config file to be used, pass its
# name in - e.g. "source start.sh nav" to use nav.launch as the file.
#
# The directory for the launch files is ~/ros_ws/src/bike/scripts/Launch/
roslaunch bike ${1:-run_with_kalman}.launch time:=$TIME
