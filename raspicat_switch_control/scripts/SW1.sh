#!/bin/bash -e

# waypoint_navigation_restart

# When the switch is off
if [ $1 = "off" ] || [ -n "$count" ]; then
  echo restart_waypoint_navigation
  rosservice call --wait /way_nav_restart & 
  led_off 2
  sleep 2
fi
########################

# waypoint_navigation_start

# When the switch is on
if [ $1 = "on" ] && [ -z "$count" ]; then
  echo start_waypoint_navigation
  rosservice call --wait /way_nav_start & 
  led_on 2
  count=0
  sleep 2
fi
#######################
