#!/usr/bin/env bash

# install vundle for VIM
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# create MPD dirs & files
mkdir ~/.config/mpd/playlists
touch ~/.config/mpd/{database,log,pid,state,sticker.sql}
# Update MPD config
sed -i -e "s/artur2/$USER/g" .mpdconf
