#!/usr/bin/env bash

xrandr --output eDP-1 --off \
    --output HDMI-1 --auto --scale 1.8x1.8 --panning 3456x1944+0+0 \
    --output DP-2 --auto --scale 1.8x1.8 --panning 3456x1944+3456+0 \
    --fb 6912x1944

# Sometimes doesn't work for the first time, so retry
xrandr --output eDP-1 --off \
    --output HDMI-1 --auto --scale 1.8x1.8 --panning 3456x1944+0+0 \
    --output DP-2 --auto --scale 1.8x1.8 --panning 3456x1944+3456+0 \
    --fb 6912x1944

killall plasmashell
sleep 1
plasmashell > /dev/null  2> /dev/null&
