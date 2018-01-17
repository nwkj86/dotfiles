#!/usr/bin/env bash

xrandr --output eDP-1 --auto \
    --output HDMI-1 --off \
    --output DP-2 --off

killall plasmashell
sleep 1
plasmashell > /dev/null  2> /dev/null&

