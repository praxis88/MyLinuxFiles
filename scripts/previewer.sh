#!/bin/sh
#LINES=30

    case "$1" in
	*.png|*.jpg|*.jpeg|*.mkv|*.mp4) mediainfo "$1";;
        *.tar*) tar tf "$1";;
        *.zip) unzip -l "$1";;
        *.rar) unrar l "$1";;
        *.7z) 7z l "$1";;
        *.pdf) pdftotext "$1" -;;
	*.zsh*|*.bash*|*.git*|*.conf|*.*rc) pistol "$1";;
        *) highlight -O ansi "$1" || cat "$1";;
    esac

