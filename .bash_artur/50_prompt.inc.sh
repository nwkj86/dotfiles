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
    local exit_code_color=$crf_red
  fi

  local git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d ' ')

  PS1="$cbf_blue[$exit_code_color\#$cbf_blue]"        # command counter
  PS1+=" "
  PS1+="$cbf_white\u$crf_blue@$cbf_white\h$cbf_white" # username@host
  PS1+=":"
  PS1+="$crf_green\w"                                 # working dir
  PS1+=" "
  if [ -n "$git_branch" ]; then
    PS1+="$cbf_blue[$cbf_orange$git_branch$cbf_blue]"
  fi
  if [ $(id -u) -eq 0 ]; then # white '>' for regular user and red '$' for root
    PS1+=" ${crf_red}$"
  else
    PS1+=" ${crf_white}>"
  fi
  PS1+="$c_reset\n"
}

unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"