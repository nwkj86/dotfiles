###
# Prompt
###
export PROMPT_COMMAND=__prompt_command
function __prompt_command()
{
  local es=$?
  if [ $es -eq 0 ]; then
    local exit_code_color=$crf_green
  else
    local exit_code_color=$cbf_red
  fi

  local git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d ' ')
  local svn_rev=$(svn info . 2> /dev/null | awk -F ':' '/Revision:/ { print $2 }')

  PS1="$cbf_blue[$exit_code_color\#$cbf_blue]"        # command counter
  PS1+=" "
  PS1+="$cbf_white\u$cbf_blue@$cbf_white\h$cbf_white" # username@host
  PS1+=":"
  PS1+="$cbf_green\w"                                 # working dir
  PS1+=" "

  if [ -n "$git_branch" ]; then
    PS1+="$cbf_blue[${cbf_cyan}git: $cbf_orange$git_branch$cbf_blue]"
  fi

  if [ -n "$svn_rev" ]; then
    PS1+="$cbf_blue[${cbf_cyan}svn:$cbf_orange$svn_rev$cbf_blue]"
  fi

  if [ $(id -u) -eq 0 ]; then # white '>' for regular user and red '$' for root
    PS1+=" ${cbf_red}$"
  else
    PS1+=" ${cbf_white}>"
  fi
  PS1+="$c_reset\n"
}

# footer
unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
