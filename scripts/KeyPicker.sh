#!/bin/zsh
KeyFind=$(xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }')
 i3-sensible-terminal -e  '$KeyFind'
 dunstify "Xev KeyPress Monitor" "launched"
