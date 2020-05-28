#!/usr/bin/env bash

#set -x

function get_file()
{
    local URL="$1"
    local NAME="${URL/?dl=0/}"
    local NAME="${NAME##*/}"
    local NAME="${NAME//%20/ }"
    local NAME="${NAME//%27/\'}"

    echo "$URL"
    echo "$NAME"

    wget \
        -q \
        --continue "$URL" \
        -O "$NAME"
}

export -f get_file

cat $1 | xargs -n 1 -P ${2:-1}  -I {} bash -c 'get_file "$@"' _ {}
