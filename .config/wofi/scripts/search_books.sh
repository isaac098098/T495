#!/bin/bash

dir="/home/isaac09809/notes/cybersecurity/bib/os"

ch=$(find "$dir" -type f \( -iname "*.pdf" -o -iname "*.djvu" -o -iname "*.cbr" -o -iname "*.epub" \) | awk -F/ '!seen[$NF]++ {print $NF}' | sort -df | wofi --cache-file=/dev/null --conf=$HOME/.config/wofi/cards --show dmenu)
book=$(find "$dir" -type f -name "$ch" | head -n 1)

if [[ "$book" ]]
then
    zathura "$book" 2>/dev/null &
fi
exit 0
