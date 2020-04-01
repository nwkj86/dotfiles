#/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
. "${SCRIPT_DIR}/common.sh"

#_RPI2_IP=10.1.1.10
#_RPI2_IP=10.10.10.10
_RPI2_IP=x230
_MY_ID=$(whoami)

notify-send "Syncing 'artur'."
sync_dirs /home/${_MY_ID}/BigDisk/ $_MY_ID@$_RPI2_IP:/home/$_MY_ID/Store/BigDisk_backup/
notify-send "Syncing done."
