# Helper for other scripts
print_footer()
{
    # If not running interactively, don't do anything
    [ -z "$PS1" ] && return

    local unit_name=$(basename "$1")
    echo "-> $unit_name"
}


