###
# settings
###
set -o vi # vi mode
set -b # notify
set editing-mode vi
set keymap vi
set convert-meta on

bind -m vi-insert "\C-l":clear-screen

stty -ixon

unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
