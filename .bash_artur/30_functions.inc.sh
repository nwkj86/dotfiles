###
# functions
###

function set_cpu_governor()
{
  for i in cpu{0,1,2,3}; do
    echo $1 > /sys/devices/system/cpu/$i/cpufreq/scaling_governor;
  done
}

function set_tmux_name()
{
  printf "\033k${1:-${PWD##*/}}\033\\"
}

function s3t()
{
  echo ${1:0:1}$((${#1}-2))${1:(-1)}
}

function savedir()
{
  local SAVE_FILE="$HOME/.savedir"
  pwd > ~/.savedir
}

function loaddir()
{
  local SAVE_FILE="$HOME/.savedir"

  if [ -r "$SAVE_FILE" ]; then
    if [ -n "$(cat "$SAVE_FILE")" ]; then
      cd "$(cat "$SAVE_FILE")"
    else
      echo "$SAVE_FILE is empty!"
    fi
  else
    echo "$SAVE_FILE is missing!"
  fi
}

function reloadbashrc() {
  . ~/.bashrc
}

function sync_dirs()
{
  #_SYNC_CMD="rsync -a -r --human-readable --delete --info=progress2"
  local _SYNC_CMD="rsync -a -r --human-readable --delete --progress"

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

function print_colors()
{
  for cmd in sgr0 bold; do
    tput $cmd
    for i in $(seq 0 7); do
      for j in $(seq 0 7); do
        tput setaf $i; tput setab $j; echo -n " $i,$j "
      done
      tput sgr0; echo; tput $cmd
    done
  done
}

# footer
unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
