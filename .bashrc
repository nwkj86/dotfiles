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

### man colors configuration
man() {
        env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

### exports
export EDITOR="vim"
export CPU_NUMBER=$(cat /proc/cpuinfo | grep "cpu MHz" | wc -l)

### history options
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=1000

### compilation options
#export CFLAGS=" -O2 -march=native -mtune=native -pipe -s -fomit-frame-pointer"
#export CXXFLAGS="$CFLAGS"
#export CHOST="x86_64-arch-linux-gnu"
#export MAKEFLAGS=" -j${CPU_NUMBER}"
#export LDFLAGS="-Wl,--hash-style=gnu,--as-needed,-O2"

