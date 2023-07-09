#!/bin/bash -e

if [ -z "$HOTSPOT_SSID" ]
then
    echo "HOTSPOT_SSID is not set."
    echo "Pease run export HOTSPOT_SSID=raspicat-your-name"
    echo "Exiting..."
    exit 1
fi

sed -i "s/HOTSPOT_SSID_NAME/$HOTSPOT_SSID/g" ../service/raspicat_hotspot.service

sudo apt-get install -y dnsmasq hostapd iw network-manager
git clone https://github.com/oblique/create_ap
cd create_ap
sudo make install
cd -
rm -rf create_ap
sudo cp $(ros2 pkg prefix --share raspicat_setup_scripts)/hotspot/service/raspicat_hotspot.service /etc/systemd/system/raspicat_hotspot.service
sudo systemctl daemon-reload
sudo systemctl enable raspicat_hotspot.service
sudo systemctl restart raspicat_hotspot.service
