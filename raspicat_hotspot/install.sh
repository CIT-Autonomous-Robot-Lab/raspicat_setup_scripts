#!/bin/bash -e

sudo apt-get install -y dnsmasq hostapd network-manager
git clone https://github.com/oblique/create_ap
cd create_ap
sudo make install
cd -
rm -rf create_ap
sudo ln -s $(rospack find raspicat_hotspot)/service/raspicat_hotspot.service /etc/systemd/system/raspicat_hotspot.service
sudo systemctl enable raspicat_hotspot.service
sudo systemctl start raspicat_hotspot.service
