#!/bin/bash

targetImage="${1##*/}"

for f in *.{png,jpg}; do
	[[ "$f" = "$targetImage" ]] && continue
	images+=("$f")
done

sxiv "$targetImage" "${images[@]}" 2>/dev/null &
