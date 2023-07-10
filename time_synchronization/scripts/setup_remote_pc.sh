#!/bin/bash -e

sudo apt install -y chrony

sudo bash -c 'echo -e "\nallow 192.168.0/24\nallow 10.42/24" >> /etc/chrony/chrony.conf'

sudo systemctl restart chrony.service
