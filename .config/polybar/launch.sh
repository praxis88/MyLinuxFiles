#!/usr/bin/env bash

#kill all running instances
killall -q polybar

#launch bar

echo "---" | tee -a /tmp/polybar1.log 




if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar1 &
  done
else
  polybar --reload bar1 &
fi

echo "Bar Launched..."