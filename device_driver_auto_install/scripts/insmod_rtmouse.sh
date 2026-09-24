#!/usr/bin/env bash

set -eu

source ~/.bashrc

sudo /sbin/modprobe rtmouse || sudo /bin/bash $(ros2 pkg prefix --share raspberry_pi_mouse)/utils/build_install.bash
sleep 1
sudo /bin/chmod 666 /dev/rt*
sleep 1
/bin/echo 0 > /dev/rtmotoren0

for i in `seq 1 10`
do
echo 1 | tee /dev/rtled?
sleep 0.5
echo 0 | tee /dev/rtled?
sleep 0.5
done
