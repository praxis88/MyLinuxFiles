#!/bin/bash

selected=$(echo "Main
Main&Vertical
Overhead
TV
Work Mode
TV&Main" | rofi -dmenu)




if [ "$selected" == "Main" ]
then
	xrandr --output DP-0 --mode 1920x1080
	xrandr --output DVI-D-0 --off
	xrandr --output HDMI-0 --off
	xrandr --output HDMI-1 --off
	/home/christopher/scripts/wallpaperSet.sh
	notify-send $selected 'Monitor Profile Activated'
	sleep 3
	launch.sh

elif [ "$selected" == "Main&Vertical" ]
then
	xrandr --output DP-0 --mode 1920x1080 --primary
	xrandr --output DVI-D-0 --mode 1920x1080 --rotate right --right-of DP-0
	xrandr --output HDMI-0 --off
	xrandr --output HDMI-1 --off
	/home/christopher/scripts/wallpaperSet.sh
	notify-send $selected 'Monitor Profile Activated'
	sleep 3
	launch.sh

elif [ "$selected" == "Overhead" ]
then
	xrandr --output DVI-D-0 --off
	xrandr --output HDMI-0 --mode 1280x720
	xrandr --output HDMI-1 --off
	notify-send $selected 'Monitor Profile Activated'
	/home/christopher/scripts/wallpaperSet.sh
	sleep 3
	launch.sh

elif [ "$selected" == "TV" ]
then
	xrandr --output DP-0 --off
	xrandr --output DVI-D-0 --off
	xrandr --output HDMI-0 --off
	xrandr --output HDMI-1 --mode 1920x1080 --rate 60
	notify-send $selected 'Monitor Profile Activated'
	/home/christopher/scripts/wallpaperSet.sh
	sleep 3
	launch.sh

elif [ "$selected" == "Work Mode" ]
then
	xrandr --output DVI-D-0 --mode 1920x1080
	xrandr --output HDMI-0 --mode 1280x720 --above DVI-D-0
	xrandr --output HDMI-1 --off
	notify-send $selected 'Monitor Profile Activated'
	/home/christopher/scripts/wallpaperSet.sh
	sleep 3
	launch.sh

elif [ "$selected" == "TV&Main" ]
then
	xrandr --output DVI-D-0 --off
	xrandr --output DP-0 --mode 1920x1080 --primary
	xrandr --output HDMI-0 --off
	xrandr --output HDMI-1 --mode 1920x1080 --right-of DP-0
	notify-send $selected 'Monitor Profile Activated'
	/home/christopher/scripts/wallpaperSet.sh
	sleep 3
	launch.sh
else
	notify-send 'No profile selected'
fi

