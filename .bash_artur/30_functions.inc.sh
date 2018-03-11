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

function print_colors()
{
  for cmd in sgr0 bold; do
    tput $cmd
    for i in {0..7}; do
      for j in {0..7}; do
        tput setaf $i; tput setab $j; echo -n " $i,$j "
      done
      tput sgr0; echo; tput $cmd
    done
  done

  echo
  echo

  for i in {0..31}; do
    for j in {0..7}; do
      x=$((8*i+j))
      printf "\x1b[38;5;${x}mcolour${x}\x1b[0m\t"
    done
    echo
  done

awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s s s s s s s s s s s s s s s s;
    for (colnum = 0; colnum<256; colnum++) {
        r = 255-(colnum*255/255);
        g = (colnum*510/255);
        b = (colnum*255/255);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'

}


print_footer $BASH_SOURCE
