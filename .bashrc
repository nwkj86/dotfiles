### Colors
 # reset terminal colors
c_reset="\[\e[0m\]"
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

### include profile file
source /etc/profile

### include global bashrc file
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi

### my prompt
export PS1="$cbf_blue[$crf_blue\#$cbf_blue] $cbf_white\u$crf_blue@$cbf_white\h$cbf_white:$crf_green\w$crf_white\n> $c_reset"

### set LS_COLORS
dircolors > /dev/null

### aliases
alias ls="ls --color=auto -F"
alias ll="ls -l -a -h --color=auto -F"
alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias tmux="tmux -2"

### termcap colors (man, ...)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

### exports
export EDITOR="vim"
export CPU_NUM=$(cat /proc/cpuinfo | grep "cpu MHz" | wc -l)

### history options
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=1024

# bash settings
set -o vi # vi mode
set editing-mode vi
set keymap vi
set convert-meta on
bind -m vi-insert "\C-l":clear-screen
