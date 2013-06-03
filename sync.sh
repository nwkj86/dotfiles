#!/bin/bash

### Colors
 # reset terminal colors
c_reset="\e[0m"
 # regular foreground
crf_red=$(tput setaf 1)
crf_green=$(tput setaf 2)
crf_orange=$(tput setaf 3)
crf_blue=$(tput setaf 4)
crf_pink=$(tput setaf 5)
crf_cyan=$(tput setaf 6)
crf_white=$(tput setaf 7)
 # bold foreground
cbf_red=$(tput bold; tput setaf 1)
cbf_green=$(tput bold; tput setaf 2)
cbf_orange=$(tput bold; tput setaf 3)
cbf_blue=$(tput bold; tput setaf 4)
cbf_pink=$(tput bold; tput setaf 5)
cbf_cyan=$(tput bold; tput setaf 6)
cbf_white=$(tput bold; tput setaf 7)
_MY_ID=$(whoami)

# Storages
_BIG_DISK="/home/${_MY_ID}/BigDisk"
_STORAGE="/home/${_MY_ID}/Storage"
# Backup homedir
_HOME_BACKUP="home_backup"
# Sync command
_SYNC_CMD="rsync -a -r --delete -h  "

function sync_dirs
{
    if [ "$#" == "0" ]; then
        echo "Need start dir..."
    fi

    DIR_FROM=$1
    shift

    while (( "$#" )); do
        DIR_TO=$1
        echo -e "${cbf_green}Syncing $crf_green${DIR_FROM}$crf_white --> $crf_red${DIR_TO}$c_reset"
        ${_SYNC_CMD} ${DIR_FROM} ${DIR_TO}
        shift
    done
}

# Backup home dir
for dir in Dodatki Dokumenty Dropbox Książki Pobrane Roboczy; do
    sync_dirs /home/${_MY_ID}/${dir}/ ${_STORAGE}/${_HOME_BACKUP}/${dir}/ ${_BIG_DISK}/${_HOME_BACKUP}/${dir}/
done

# Backup music
sync_dirs /home/${_MY_ID}/Muzyka/Mieszana/ ${_STORAGE}/Muzyka/Mieszana/ ${_BIG_DISK}/Muzyka/Mieszana/

# Sync Storage with BigDisk
sync_dirs ${_BIG_DISK}/Książki/        ${_STORAGE}/Książki/
sync_dirs ${_BIG_DISK}/Muzyka/         ${_STORAGE}/Muzyka/
sync_dirs ${_BIG_DISK}/Różne/          ${_STORAGE}/Różne/
sync_dirs ${_BIG_DISK}/Zdjęcia/        ${_STORAGE}/Zdjęcia/

sync_dirs ${_BIG_DISK}/Wideo/Seriale/  ${_STORAGE}/Wideo/Seriale/
sync_dirs ${_BIG_DISK}/Wideo/MIT/      ${_STORAGE}/Wideo/MIT/
sync_dirs ${_BIG_DISK}/Wideo/Channel9/ ${_STORAGE}/Wideo/Channel9/
