#!/bin/zsh

pape=$(ls /usr/share/pixmaps/papes/ | rofi -dmenu -p "Which Pape? >  "); echo "${pape}"
xwallpaper --screen 0 --stretch /usr/share/pixmaps/papes/$pape 
dunstify "Wallpaper Set" "$pape"
