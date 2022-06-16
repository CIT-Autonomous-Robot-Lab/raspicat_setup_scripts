#!/bin/bash -e

# waypoint_navigation_start

# When the switch is on
if [ $1 = "on" ] && [ -z "$count" ]; then
  echo start_waypoint_navigation
  rostopic pub -1 /way_nav_start std_msgs/Empty
  led_on 2
  count=0
  sleep 2
fi
#######################

# When the switch is off
if [ $1 = "off" ] || [ -n "$count" ]; then
  echo restart_waypoint_navigation
  rostopic pub -1 /way_nav_restart std_msgs/Empty
  led_off 2
  sleep 2
fi
########################
