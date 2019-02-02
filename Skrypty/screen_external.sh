#!/usr/bin/env bash

xrandr --output eDP-1 --off \
    --output DP-2 --auto \
    --output HDMI-1 --auto --right-of DP-2 \

# Sometimes doesn't work for the first time, so retry

#killall plasmashell
#sleep 1
#plasmashell > /dev/null  2> /dev/null&
