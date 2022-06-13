#!/bin/bash -e

sudo ln -s $(rospack find raspicat_switch_control)/service/raspicat_switch_control.service /etc/systemd/system/raspicat_switch_control.service
sudo systemctl enable raspicat_switch_control.service
sudo systemctl start raspicat_switch_control.service