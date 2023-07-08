#!/bin/bash -e

if [ ! ${EUID:-${UID}} = 0 ]; then
	echo "You need to run this script as root." && exit 1
fi

#fdisk -l 
#ls -l /dev/disk/by-uuid

echo "UUID=$1 /mnt/ssd auto defaults,uid=1000,gid=1000,umask=002 0 0" >> /etc/fstab
