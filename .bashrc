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
. $BASH_ARTUR_DIR/colors
. $BASH_ARTUR_DIR/prompt
. $BASH_ARTUR_DIR/aliases
. $BASH_ARTUR_DIR/functions
. $BASH_ARTUR_DIR/settings
. $BASH_ARTUR_DIR/exports
. $BASH_ARTUR_DIR/ponysay

