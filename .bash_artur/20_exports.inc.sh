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
# man
###
export MANWIDTH=80 # easier to read

###
# exports
###
export EDITOR="vim"
export CPU_NUM=$(cat /proc/cpuinfo | grep "cpu MHz" | wc -l)

###
# history options
###
export HISTIGNORE="&:md5sum:sha1sum:echo:ls:[bf]g:exit"
export HISTSIZE=1024

###
# MPD
###
export MPD_PORT=26600

###
# LibreOffie fresh
###
export SAL_USE_VCLPLUGIN=gtk

###
# Compilation *FLAGS
###
export CFLAGS="-march=native -mtune=native -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
export CXXFLAGS=$CFLAGS
export MAKEFLAGS="-j4"

# footer
unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
