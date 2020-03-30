#!/bin/sh

if [ $(uname -n) == 'Laptop' ]; then 
	setxkbmap -model chromebook
	echo "Chromebook Keyboard Model Set!"
fi
