#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

init () {
  led_off 0
  led_off 1
  led_off 2
  led_off 3
}

led_on () {
  echo 1 > /dev/rtled$1
  if [ $1 = 0 ]; then
    led_0=1
  elif [ $1 = 1 ]; then
    led_1=1
  elif [ $1 = 2 ]; then
    led_2=1
  elif [ $1 = 3 ]; then
    led_3=1
  fi
}

led_off () {
  echo 0 > /dev/rtled$1
  if [ $1 = 0 ]; then
    led_0=0
  elif [ $1 = 1 ]; then
    led_1=0
  elif [ $1 = 2 ]; then
    led_2=0
  elif [ $1 = 3 ]; then
    led_3=0
  fi
}

check_switch_status () {
  switch_status=`cat /dev/rtswitch$1`
}

check_led_status () {
  led=led_$1
  led_status=$[led_$1]
}

SW0 () {
  check_switch_status 0
  check_led_status 1
  if [ $switch_status = 0 -a $led_status = 0 ]; then
    . $SCRIPT_DIR/SW0.sh on
  elif [ $switch_status = 0 -a $led_status = 1 ]; then
    . $SCRIPT_DIR/SW0.sh off
  fi
}

SW1 () {
  check_switch_status 1
  check_led_status 2
  if [ $switch_status = 0 -a $led_status = 0 ]; then
    . $SCRIPT_DIR/SW1.sh on
  elif [ $switch_status = 0 -a $led_status = 1 ]; then
    . $SCRIPT_DIR/SW1.sh off
  fi
}

SW2 () {
  check_switch_status 2
  check_led_status 3
  if [ $switch_status = 0 -a $led_status = 0 ]; then
    . $SCRIPT_DIR/SW2.sh on
  elif [ $switch_status = 0 -a $led_status = 1 ]; then
    . $SCRIPT_DIR/SW2.sh off
  fi
}

raspicat_switch_control () {
  SW0
  SW1
  SW2
}

check_ros_process () {
  if [ -n "$(pgrep rosmaster)" ]; then
    led_on 0
  else
    led_off 0
  fi
}

exit () {
  init
  killall -9 rosmaster
}

trap 'exit' EXIT

main () {
  source ~/.bashrc
  init
  while :
  do
    raspicat_switch_control
    check_ros_process
    sleep 0.01
  done
}

main
