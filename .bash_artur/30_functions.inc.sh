###
# functions
###

function set_cpu_governor()

{
  for i in cpu{0,1,2,3}; do
    echo $1 > /sys/devices/system/cpu/$i/cpufreq/scaling_governor;
  done
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
    if [ -n $(cat "$SAVE_FILE") ]; then
      cd $(cat "$SAVE_FILE")
    else
      echo "$SAVE_FILE is empty!"
    fi
  else
    echo "$SAVE_FILE is missing!"
  fi
}

function settitle() {
  local TITLE=${1:-$(basename $(realpath .))}
  printf "\033k${TITLE}\033\\"
}

function reloadbashrc() {
  . ~/.bashrc
}

unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
