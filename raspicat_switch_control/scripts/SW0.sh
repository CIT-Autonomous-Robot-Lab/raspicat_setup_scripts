#!/bin/bash -e

# launch raspicat_navigation

# When the switch is on
if [ $1 = "on" ]; then
  echo start_raspicat_navigation
  docker rm -f raspicat-noetic
  docker run --privileged --net=host -v /dev:/dev -e ROS_MASTER_URI=http://192.168.12.1:11311 -e ROS_HOSTNAME=192.168.12.1 -e PULSE_COOKIE=/tmp/pulse/cookie -e PULSE_SERVER=unix:/tmp/pulse/native -v /run/user/1000/pulse/native:/tmp/pulse/native -v ~/.config/pulse/cookie:/tmp/pulse/cookie:ro --name raspicat-noetic ubeike/raspicat-noetic:arm64v8 bash -c 'source ~/catkin_ws/devel/setup.bash;roslaunch raspicat_waypoint_navigation raspicat_raspi_only_navigation.launch urg:=true mcl:=emcl2 world_name:=tsukuba lidar_ether:=true lidar_ip_address:=172.16.0.10' &
  led_on 1
  sleep 3
fi
#######################

# kill raspicat_navigation

# When the switch is off
if [ $1 = "off" ]; then
  echo finish_raspicat_navigation
  docker exec raspicat-noetic pkill -9 rosmaster
  led_off 1
  sleep 3
  exit
fi
########################
