#!/bin/bash

selected=$(echo "Main
Overhead
TV
Work Mode
TV&Main" | rofi -dmenu)




if [ "$selected" == "Main" ]
then
	xrandr --output DVI-D-0 --mode 1920x1080
	xrandr --output HDMI-0 --off
	xrandr --output HDMI-1 --off

elif [ "$selected" == "Overhead" ]
then
	xrandr --output DVI-D-0 --off
	xrandr --output HDMI-0 --mode 1280x720
	xrandr --output HDMI-1 --off

elif [ "$selected" == "TV" ]
then
	xrandr --output DVI-D-0 --off
	xrandr --output HDMI-0 --off
	xrandr --output HDMI-1 --mode 1280x720

elif [ "$selected" == "Work Mode" ]
then
	xrandr --output DVI-D-0 --mode 1920x1080
	xrandr --output HDMI-0 --mode 1280x720 --above DVI-D-0
	xrandr --output HDMI-1 --off

elif [ "$selected" == "TV&Main" ]
then
	xrandr --output DVI-D-0 --mode 1920x1080
	xrandr --output HDMI-0 --off
	xrandr --output HDMI-1 --mode 1280x720 --right-of DVI-D-0
fi

notify-send $selected 'Monitor Profile Activated'
/home/christopher/scripts/wallpaperSet.sh
