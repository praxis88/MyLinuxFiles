#!/usr/bin/env bash

#kill all running instances
killall -q polybar

#launch bar

echo "---" | tee -a /tmp/polybar1.log 
polybar bar1 >> /tmp/polybar1.log 2>&1 &

dunstify "PolyBar Relaunched" "by launch.sh"
