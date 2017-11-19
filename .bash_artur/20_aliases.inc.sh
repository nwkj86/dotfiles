###
# aliases
###

# tmux
alias tmux="tmux -2"

# toolchain commands
alias ls="ls --color=auto -F"
alias ll="ls -l -a -h --color=auto -F"
alias rm="rm -v --preserve-root"
alias cp="cp -v"
alias mv="mv -v"
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# ctags for cpp
alias ctagsgenerate="ctags -R --c++-kinds=+p --fields=+iaS --extra=+f+q .; cscope -R -b ;"

# remote to rpi2
alias rpi2_x11="Xnest -query rpi2 -geometry 800x600 :2"
# (u)mount rpi2 resources
alias rpi2_mount="mount ~/rpi2/artur2; mount ~/rpi2/public;"
alias rpi2_umount="umount ~/rpi2/artur2; umount ~/rpi2/public;"

# package manager
alias upgrade_system="yaourt -Syu --noconfirm --aur --devel"

# break path down
alias path='echo -e ${PATH//:/\\n}'

# date & time
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# show opened ports
alias ports='netstat -tulanp'

# footer
unit_name="$(basename $BASH_SOURCE)"

if [ -n $(which nvim) ]; then
    alias vim=nvim
    alias vi=nvim
elif [ -n $(which vim) ]; then
    alias vi=vim
fi

print_footer $BASH_SOURCE
