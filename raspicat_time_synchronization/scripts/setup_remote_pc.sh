#!/bin/bash -e

if [ ! ${EUID:-${UID}} = 0 ]; then
	echo "You need to run this script as root." && exit 1
fi

apt install -y chrony

echo "
allow 192.168.0/24
allow 10.42/24" >> /etc/chrony/chrony.conf

systemctl restart chrony.service
