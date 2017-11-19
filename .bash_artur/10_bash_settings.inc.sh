###
# settings
###

# vi mode
set -o vi
set editing-mode vi
set keymap vi
bind -m vi-insert "\C-l":clear-screen

# notify
set -b

# resize on every command
shopt -s checkwinsize

set convert-meta on

# disable Ctrl-S/Ctrl-Q
stty -ixon

# merge resources
if [ -e $HOME/.Xresources ]; then
    xrdb $HOME/.Xresources
fi

print_footer $BASH_SOURCE
