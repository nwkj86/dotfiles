###
# interactive?
###
#if [[ $- != *i* ]] ; then
#  return
#fi

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
# bash Artur
###
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BASH_ARTUR_DIR=~/.bash_artur
for s in $BASH_ARTUR_DIR/*.inc.sh; do
  . $s
done

