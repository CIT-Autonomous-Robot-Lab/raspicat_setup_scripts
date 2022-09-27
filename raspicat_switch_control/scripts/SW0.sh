#!/bin/bash -e

# launch raspicat_navigation

# When the switch is on
if [ $1 = "on" ]; then
  echo start_raspicat_navigation
  roslaunch raspicat_waypoint_navigation raspicat_raspi_only_navigation.launch urg:=true mcl_init_pose_x:=0.0 mcl_init_pose_y:=0.0 mcl_init_pose_a:=0.0 waypoint_yaml_file:=$(rospack find raspicat_waypoint_navigation)/config/waypoint/waypoint_tsukuba.yaml move_base_map_file:=$(rospack find raspicat_waypoint_navigation)/config/maps/for_move_base/map_tsukuba.yaml mcl_map_file:=$(rospack find raspicat_waypoint_navigation)/config/maps/tsukuba/map_tsukuba.yaml lidar_ether:=true lidar_ip_address:=172.16.0.10 &
  raspicat_navigation_pid=$!
  led_on 1
  sleep 3
fi
#######################

# kill raspicat_navigation

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
