#!/usr/bin/env bash

_SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
. "${_SCRIPT_DIR}/common.sh"

_MY_ID=$(whoami)
# Storages
_BIG_DISK="/home/${_MY_ID}/BigDisk"
# Backup homedir
_HOME_BACKUP="home_backup"

# Backup home dir
#for dir in Android Dodatki Dokumenty Dropbox Książki Pobrane Roboczy; do
#  sync_dirs /home/${_MY_ID}/${dir}/ ${_BIG_DISK}/${_HOME_BACKUP}/${dir}/
#done
sync_dirs \
    --exclude-from=${_SCRIPT_DIR}/excluded_from_sync.lst \
    /home/${_MY_ID}/ \
    ${_BIG_DISK}/${_HOME_BACKUP}/${_MY_ID}/

# Join mixed music into music dir
sync_dirs \
    --exclude-from=${_SCRIPT_DIR}/excluded_from_sync.lst \
    /home/${_MY_ID}/Muzyka/Mieszana/ \
    ${_BIG_DISK}/Muzyka/Mieszana/
