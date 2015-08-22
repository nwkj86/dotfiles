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

unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
