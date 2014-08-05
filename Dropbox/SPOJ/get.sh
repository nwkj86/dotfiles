#!/bin/bash
# exit on error
set -e

read -p "User: " _USER
read -s -p "Password: " _PASS

_COOKIES="cookies.txt"

###
_WGET="wget -q"
_WGET_WITH_COOKIES="${_WGET} --load-cookies=${_COOKIES} --keep-session-cookies"
## SPOJ pages
_SPOJ_MAIN=http://pl.spoj.com/
_SPOJ_LIST=http://pl.spoj.com/status/${_USER}/signedlist/

###
# $1=ID, $2=TARGET_FILE
###
function get_sources
{
  URL=http://pl.spoj.com/files/src/save/$1
  if [ -f $2 ]; then
    echo "File $2 exists. Skipping."
  else
    echo -n "Downloading to ${2}..."
    ${_WGET_WITH_COOKIES} -p ${URL} -O $2 > /dev/null
    if [ -f $2 ]; then
      echo "OK"
    else
      echo "FAILED!"
      exit 1;
    fi
  fi
}

function resolve_extension
{
  case $1 in
    "C++") EXT="cpp" ;;
    "C") EXT="c" ;;

    *) EXT=$1
  esac

  echo $EXT
}

echo "Getting cookies"
rm -f ${_COOKIES} 2> /dev/null
${_WGET} --save-cookies=${_COOKIES} --post-data="login_user=${_USER}&password=${_PASS}" --keep-session-cookies -O index.html ${_SPOJ_MAIN} > /dev/null

echo "Getting myaccount page"
rm -f myaccount.html 2> /dev/null
${_WGET_WITH_COOKIES} -p ${_SPOJ_LIST} -O list.txt > /dev/null

COUNT=0

echo "Geting ACs"
grep AC list.txt | cut -d '|' -f 2,4,8 | tr -d '|' | sed 's/ \+/ /g' | \
while read line; do
  set $line

  EXT=$(resolve_extension $3)
  echo -n "${COUNT}) ID: $1 DIR: $2 EXT: $3 ($EXT)    | "
  mkdir -p "$2"
  OUT_FILE=$2/$1.$EXT
  get_sources $1 ${OUT_FILE}

  COUNT=$(($COUNT+1))
done

rm -f ${_COOKIES} list.txt index.html 2> /dev/null
