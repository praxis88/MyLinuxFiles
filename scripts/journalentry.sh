#!/bin/bash

now=$(date +%D | sed 's:/:-:g')
touch /home/christopher/Documents/Journaling/$now
i3-sensible-terminal -e 'nvim /home/christopher/Documents/Journaling/'$now

