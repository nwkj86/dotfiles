#/usr/bin/env bash
. ~/.bashrc

#_RPI2_IP=10.1.1.10
#_RPI2_IP=10.10.10.10
_RPI2_IP=rpi2
_MY_ID=$(whoami)

notify-send "Syncing 'artur'."
sync_dirs /home/${_MY_ID}/BigDisk/ $_MY_ID@$_RPI2_IP:/home/$_MY_ID/BigDisk_backup/
notify-send "Syncing done."
