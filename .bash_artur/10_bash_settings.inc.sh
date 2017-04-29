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

# disable Ctrl-S
stty -ixon

# footer
unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
