#!/bin/bash -e

# rosbag_record

# When the switch is on
if [ $1 = "on" ]; then
  echo start_rosbag_record
  mkdir -p /mnt/ssd/rosbag/
  rostopic pub -1 /rosbag_record_start std_msgs/Empty
  rosrun rosbag record -a -o /mnt/ssd/rosbag/navigation &
  rosbag_record_pid=$!
  led_on 3
  sleep 3
fi
#######################

# When the switch is off
if [ $1 = "off" ]; then
  echo finish_rosbag_record
  rostopic pub -1 /rosbag_record_finish std_msgs/Empty
  kill $rosbag_record_pid
  led_off 3
  sleep 3
fi
########################
