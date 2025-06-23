#!/bin/bash

dir=""

ch=$(find "$dir" -type f | awk -F/ '!seen[$NF]++ {print $NF}' | wofi --cache-file=/dev/null --conf=$HOME/.config/wofi/cards --show dmenu)
book=$(find "$dir" -type f -name "$ch" | awk '!seen[$NF]++')

if [[ "$book" ]]
then
    zathura "$book" 2>/dev/null &
fi
exit 0
