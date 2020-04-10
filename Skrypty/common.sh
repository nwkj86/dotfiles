#!/usr/bin/env bash

function sync_dirs()
{
  local _SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
  local _PROGRESS="--progress"
  #local _PROGRESS="--info=progress2"

  local _SYNC_CMD="rsync -a -r --human-readable --delete ${_PROGRESS} --exclude-from=${_SCRIPT_DIR}/excluded_from_sync.lst"

  if [ "$#" == "0" ]; then
    echo "Need start dir..."
  fi

  local DIR_FROM=$1
  shift

  while (( "$#" )); do
    local DIR_TO=$1
    #mkdir -p $DIR_TO
    echo -e "${cbf_orange}Syncing $crf_blue${DIR_FROM}$crf_white --> $crf_blue${DIR_TO}$c_reset --- "
    ${_SYNC_CMD} ${DIR_FROM} ${DIR_TO} 2> /dev/null && echo -e "${cbf_green}OK$c_reset" || echo -e "${cbf_red}FAILED$c_reset"
    shift
  done
}

