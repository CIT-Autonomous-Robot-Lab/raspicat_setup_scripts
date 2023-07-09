#!/bin/bash -e

sudo apt-get install -y dnsmasq hostapd iw network-manager
git clone https://github.com/oblique/create_ap
cd create_ap
sudo make install
cd -
rm -rf create_ap
sudo cp $(ros2 pkg prefix --share raspicat_setup_scripts)/hotspot/service/raspicat_hotspot.service /etc/systemd/system/raspicat_hotspot.service
sudo systemctl enable raspicat_hotspot.service
sudo systemctl restart raspicat_hotspot.service
