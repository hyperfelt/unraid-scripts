#!/bin/bash
#name=Backup to external drive
#description=This script performs a backup of the whole array to an external drive. Needs "Unassigned Devices" plugin to work.
#arrayStarted=true

# Put your array name here
arrayToBackup="Files"

# Put your drive name here
externalDrive="ST1000DM010-2EP102_ZN17ZDCH"

if [ -d "/mnt/user/$arrayToBackup" ]
then
	if [ -d "/mnt/disks/$externalDrive" ]
	then
		echo "Beginning backup to an external drive using rsync..."
		rsync -av --delete /mnt/user/$arrayToBackup/ /mnt/disks/$externalDrive/
		echo "End of the backup."
	else
		echo "The external drive $externalDrive does not exist, it may not be plugged in or not mounted. Aborting backup to an external drive."
	fi
else
	echo "The array $arrayToBackup does not exist. Aborting backup to an external drive."
fi