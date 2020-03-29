#!/bin/bash

target Image="${1##*/}"

for f in *.{png,jpg}; do
	[["$f" = "$targetImage" ]] && continue
	images+=("f")
done

sxiv -b "$targetImage" "${images[@]}" &
