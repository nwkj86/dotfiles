#!/usr/bin/env bash

xrandr --output eDP-1 --off \
    --output HDMI-1 --auto \
    --output DP-2 --auto --right-of HDMI-1 \

# Sometimes doesn't work for the first time, so retry

#killall plasmashell
#sleep 1
#plasmashell > /dev/null  2> /dev/null&
