#!/bin/bash -e

# raspicat_navigation

# When the switch is on
if [ $1 = "on" ]; then
  echo start_raspicat_navigation
  roslaunch raspicat_waypoint_navigation raspicat_raspi_only_navigation.launch rplidar:=true &
  raspicat_navigation_pid=$!
  led_on 1
  sleep 3
fi
#######################

# When the switch is off
if [ $1 = "off" ]; then
  echo finish_raspicat_navigation
  kill $raspicat_navigation_pid
  led_off 1
  killall rosmaster
  exit
  sleep 3
fi
########################
