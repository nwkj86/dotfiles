_RPI2_IP=10.1.1.10
_SYNC_CMD="rsync -a -r --human-readable --delete --verbose --progress "
#_SYNC_CMD="rsync -a -r --human-readable --delete "
_MY_ID=$(whoami)

function sync_dirs
{
  if [ "$#" == "0" ]; then
    echo "Need start dir..."
  fi

  DIR_FROM=$1
  shift

  while (( "$#" )); do
    DIR_TO=$1
    mkdir -p $DIR_TO
    echo -e -n "${cbf_orange}Syncing $crf_blue${DIR_FROM}$crf_white --> $crf_blue${DIR_TO}$c_reset --- "
    ${_SYNC_CMD} ${DIR_FROM} ${DIR_TO} 2> /dev/null && echo -e "${cbf_green}OK$c_reset" || echo -e "${cbf_red}FAILED$c_reset"
    shift
  done
}
set -x
notify-send "Syncing 'artur'."
sync_dirs /home/${_MY_ID}/BigDisk/ $_MY_ID@$_RPI2_IP:/home/$_MY_ID/BigDisk_backup/
notify-send "Syncing done."
