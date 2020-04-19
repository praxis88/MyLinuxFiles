#!/bin/sh

if [ $(uname -n) == 'Laptop' ]; then 
	setxkbmap -model chromebook
	dunstify "Chromebook Keyboard Model Set!"
fi
