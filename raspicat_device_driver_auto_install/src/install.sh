#!/bin/bash -e
set -eu

#if [ ! ${EUID:-${UID}} = 0 ]; then
#	echo "You need to run this script as root." && exit 1
#fi

[ -d /home/ubuntu ] && NAME=ubuntu

sudo apt-get install screen || { sudo apt-get update && sudo apt-get install screen; }

if [ $NAME == "ubuntu" ]; then
	sudo cp $(rospack find raspicat_device_driver_auto_install)/etc/systemd/system/raspicat.service.ubuntu /etc/systemd/system/raspicat.service
	sudo systemctl daemon-reload
	sudo systemctl enable raspicat.service
	sudo systemctl restart raspicat.service
	echo 'Run "systemctl start raspicat"'
else
	echo 'Your $HOME seems to be neither "/home/ubuntu"".'
fi
