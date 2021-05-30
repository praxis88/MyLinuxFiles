#!/bin/zsh

pape=$(ls /usr/share/backgrounds/ | rofi -dmenu -p "Which Pape? >  ")
papepath=/usr/share/backgrounds/$pape
xwallpaper --screen 0 --stretch $papepath
sed -i "s|background =.*|background = $papepath|g" /etc/lightdm/slick-greeter.conf
dunstify "Wallpaper Set" "$pape"
