###
# rpi2 related
###

# remote to rpi2
alias rpi2_x11="Xnest -query rpi2 -geometry 800x600 :2"

function rpi2_mount()
{
    mount ~/rpi2/public
    mount ~/rpi2/artur2
}

function rpi2_umount()
{
    umount ~/rpi2/artur2
    umount ~/rpi2/public
}

print_footer $BASH_SOURCE
