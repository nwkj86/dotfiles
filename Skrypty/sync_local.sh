#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
. "${SCRIPT_DIR}/common.sh"

_MY_ID=$(whoami)
# Storages
_BIG_DISK="/home/${_MY_ID}/BigDisk"
# Backup homedir
_HOME_BACKUP="home_backup"
notify-send "Syncing started..."


# Firstly move all phone calls records from Dropbox
mkdir -p ${_BIG_DISK}/Rozmowy/{incoming,outgoing}
mv /home/${_MY_ID}/Dropbox/Aplikacje/CallRecorder_by_skvalex/incoming/* ${_BIG_DISK}/Rozmowy/incoming/ 2> /dev/null
mv /home/${_MY_ID}/Dropbox/Aplikacje/CallRecorder_by_skvalex/outgoing/* ${_BIG_DISK}/Rozmowy/outgoing/ 2> /dev/null

# Backup home dir
#for dir in Android Dodatki Dokumenty Dropbox Książki Pobrane Roboczy; do
#  sync_dirs /home/${_MY_ID}/${dir}/ ${_BIG_DISK}/${_HOME_BACKUP}/${dir}/
#done
sync_dirs /home/${_MY_ID}/ ${_BIG_DISK}/${_HOME_BACKUP}/${_MY_ID}/

# Join mixed music into music dir
sync_dirs /home/${_MY_ID}/Muzyka/Mieszana/ ${_BIG_DISK}/Muzyka/Mieszana/

notify-send "Syncing done."
