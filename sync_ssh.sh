#!/bin/env bash

DIRS_TO_SYNC="home_backup Muzyka Różne Zdjęcia"
DIR_TO_START="Storage"
TARGET_HOST="10.1.1.90"
TARGET_DIR="~"

_SYNC_CMD="rsync -a -r --human-readable --delete --verbose --progress "

for DIR in $DIRS_TO_SYNC; do
  (
    cd $DIR_TO_START &&
    echo "Syncing $DIR --> $TARGET_HOST:$TARGET_DIR"
    ssh $TARGET_HOST mkdir -p $DIR
    $_SYNC_CMD $DIR $TARGET_HOST:$TARGET_DIR
  )
done

