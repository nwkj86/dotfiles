#!/usr/bin/env bash

function sync_dirs()
{
    local _SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
    local _PROGRESS="--progress"
    #local _PROGRESS="--info=progress2"

    local _SYNC_CMD="rsync -a -r --human-readable --delete ${_PROGRESS}"

    local _START_TIME="$(date  +%Y-%M-%dT%H:%m:%S)"
    notify-send "$_START_TIME Syncing"
    $_SYNC_CMD "$@"
    local _END_TIME="$(date  +%Y-%M-%dT%H:%m:%S)"
    notify-send "$_END_TIME Syncing done"
}

