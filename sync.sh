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
_SYNC_CMD="rsync -a -r --human-readable --delete "

function sync_dirs
{
    if [ "$#" == "0" ]; then
        echo "Need start dir..."
    fi

    DIR_FROM=$1
    shift

    while (( "$#" )); do
        DIR_TO=$1
        echo -e -n "${cbf_orange}Syncing $crf_blue${DIR_FROM}$crf_white --> $crf_blue${DIR_TO}$c_reset --- "
        ${_SYNC_CMD} ${DIR_FROM} ${DIR_TO} 2> /dev/null && echo -e "${cbf_green}OK$c_reset" || echo -e "${cbf_red}FAILED$c_reset"
        shift
    done
}

notify-send "Syncing started..."

# Backup home dir
for dir in Dodatki Dokumenty Dropbox Książki Pobrane Roboczy; do
    sync_dirs /home/${_MY_ID}/${dir}/ ${_STORAGE}/${_HOME_BACKUP}/${dir}/ ${_BIG_DISK}/${_HOME_BACKUP}/${dir}/
done

# Join mixed music into music dir
sync_dirs /home/${_MY_ID}/Muzyka/Mieszana/ ${_STORAGE}/Muzyka/Mieszana/ ${_BIG_DISK}/Muzyka/Mieszana/

# Sync Storage with BigDisk
for dir in Muzyka Różne Zdjęcia; do
  sync_dirs ${_BIG_DISK}/${dir}/ ${_STORAGE}/${dir}/
done

# Backup videos
sync_dirs ${_BIG_DISK}/Wideo/Seriale/  ${_STORAGE}/Wideo/Seriale/
sync_dirs ${_BIG_DISK}/Wideo/MIT/      ${_STORAGE}/Wideo/MIT/
sync_dirs ${_BIG_DISK}/Wideo/Channel9/ ${_STORAGE}/Wideo/Channel9/

notify-send "Syncing done."
