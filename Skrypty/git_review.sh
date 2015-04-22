#!/usr/bin/env bash

DIALOG_BIN="$(which dialog 2> /dev/null)";
if [ -z "DIALOG_BIN" ]; then
  echo "dialog not found"
  exit -1
fi

echo "dialog found in $DIALOG_BIN"

GIT_ROOT="$(git rev-parse --show-toplevel 2> /dev/null)"
if [ -z "$GIT_ROOT" ]; then
  echo "Not in git repo"
  exit -1
fi

declare -i TERM_COLS=$(tput cols)
declare -i TERM_LINES=$(tput lines)

if [ -z $TERM_COLS -o -z $TERM_LINES ]; then
  echo "Unable to determine terminal size"
  exit -1
fi

if [ $TERM_LINES < 10 ]; then
  echo "Terminal is too small"
  exit -1
fi

declare -i MENU_ELEMS=TERM_LINES-5

echo "GIT_ROOT = $GIT_ROOT"

ALL_ARGS="$@"

FILES=()
function get_numbered_files()
{
  declare -i c=1
  for f in $(git diff --name-only -M  $ALL_ARGS); do
    FILES+=($c $f)
    c+=1
  done
}
get_numbered_files

while [ true ]; do
  declare -i FILE_ID=$("$DIALOG_BIN" \
         --title "GIT review for $ALL_ARGS" \
         --menu "Select file" $TERM_LINES $TERM_COLS $MENU_ELEMS \
         "${FILES[@]}" 3>&2 2>&1 1>&3)
  clear

  if [ $FILE_ID -eq 0 ]; then
    exit 0
  fi

  if [ $? -ne 0 ]; then
    echo "Dialog exited with status $?"
  fi
  git difftool -M $ALL_ARGS -- ${FILES[2*$FILE_ID-1]}
done
