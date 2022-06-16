#!/bin/bash -e

if [ ! ${EUID:-${UID}} = 0 ]; then
	echo "You need to run this script as root." && exit 1
fi

echo "options snd slots=snd_usb_audio
options snd_usb_audio index=0" >> /etc/modprobe.d/alsa-base.conf

cat /proc/asound/modules

echo "Please reboot to reflect the settings."
