###
# interactive?
###
if [[ $- != *i* ]] ; then
  return
fi

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
BASH_ARTUR_DIR=~/.bash_artur
for s in $BASH_ARTUR_DIR/*; do
  . $s
done
