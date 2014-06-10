###
# Colors
###
# reset terminal colors
c_reset="$(tput sgr0)"
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

###
# include profile file
###
source /etc/profile

###
# include global bashrc file
###
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi

###
# Prompt
###
export PROMPT_COMMAND=__prompt_command
function __prompt_command()
{
  local es=$?
  if [ $es -eq 0 ]; then
    local exit_code_color=$crf_green
  else
    local exit_code_color=$crf_red
  fi

  local git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d ' ')

  PS1="$cbf_blue[$exit_code_color\#$cbf_blue]"        # command counter
  PS1+=" "
  PS1+="$cbf_white\u$crf_blue@$cbf_white\h$cbf_white" # username@host
  PS1+=":"
  PS1+="$crf_green\w"                                 # working dir
  PS1+=" "
  if [ -n "$git_branch" ]; then
    PS1+="$cbf_blue[$cbf_orange$git_branch$cbf_blue]"
  fi
  PS1+="$crf_white\n> "                               # prompt
  PS1+="$c_reset"
}

###
# set LS_COLORS
###
dircolors > /dev/null

###
# aliases
###
alias ls="ls --color=auto -F"
alias ll="ls -l -a -h --color=auto -F"
alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias tmux="tmux -2"

###
# termcap colors (man, ...)
###
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

###
# exports
###
export EDITOR="vim"
export CPU_NUM=$(cat /proc/cpuinfo | grep "cpu MHz" | wc -l)

###
# history options
###
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=1024

###
# bash settings
###
set -o vi # vi mode
set editing-mode vi
set keymap vi
set convert-meta on
bind -m vi-insert "\C-l":clear-screen

function set_cpu_governor()
{
  for i in cpu{0,1,2,3}; do
    echo $1 > /sys/devices/system/cpu/$i/cpufreq/scaling_governor;
  done
}

ponysay -o
