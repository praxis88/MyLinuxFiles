#!/bin/bash

now=$(date +%D | sed 's:/:-:g')
touch /home/christopher/Documents/Journaling/$now
alacritty -e nvim /home/christopher/Documents/Journaling/$now

