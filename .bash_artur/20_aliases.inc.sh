###
# aliases
###
alias ls="ls --color=auto -F"
alias ll="ls -l -a -h --color=auto -F"
alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias tmux="tmux -2"
alias ctagsgenerate="ctags -R --c++-kinds=+p --fields=+iaS --extra=+f+q ."

alias rpi2_x11="Xnest -query 10.10.10.10 -geometry 800x600 :2"

unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
