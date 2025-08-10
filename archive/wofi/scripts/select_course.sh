#!/bin/bash

raw=$(ls $HOME/notes)

ch=$(
    {
    for i in $raw
    do
        if [ "$i" != "current-notes" ] && [ "$i" != "pream.tex" ] && [ "$i" != "eof.tex" ] && [ "$i" != "ws" ] && [ "$i" != "name" ]
        then
            echo "$i" | tr '_' ' ' | awk '{for (i=1; i<=NF; ++i) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1'
        fi
    done
    } | wofi --cache-file=/dev/null --show dmenu -i
)

for i in $raw
do
    j=$(echo "$i" | tr '_' ' ' | awk '{for (i=1; i<=NF; ++i) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
    if [ "$ch" == "$j" ]
    then
        if [ -d "$HOME/notes/current-notes" ]
        then
            rm $HOME/notes/current-notes
        fi
        ln -sf $HOME/notes/"$i" $HOME/notes/current-notes
        exit 0
    fi
done
