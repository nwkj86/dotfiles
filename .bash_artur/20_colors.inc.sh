###
# Colors
###
# reset terminal colors
c_reset="$(tput sgr0)"
# regular foreground
crf_red=$(tput setaf 1)
crf_green=$(tput setaf 2)
crf_orange=$(tput setaf 3)
crf_blue=$(tput setaf 4)
crf_pink=$(tput setaf 5)
crf_cyan=$(tput setaf 6)
crf_white=$(tput setaf 7)
# bold foreground
cbf_red=$(tput bold; tput setaf 1)
cbf_green=$(tput bold; tput setaf 2)
cbf_orange=$(tput bold; tput setaf 3)
cbf_blue=$(tput bold; tput setaf 4)
cbf_pink=$(tput bold; tput setaf 5)
cbf_cyan=$(tput bold; tput setaf 6)
cbf_white=$(tput bold; tput setaf 7)

###
# set LS_COLORS
###
dircolors > /dev/null

unit_name="$(basename $BASH_SOURCE)"
echo -n " -> $unit_name"
