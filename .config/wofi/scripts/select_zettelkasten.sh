#!/bin/bash

zet=()
raw=$(ls $HOME/zettelkasten)

for i in $raw
do
    if [ "$i" != "current" ] && [ "$i" != "preamble.tex" ]
    then
        name=$(echo "$i" | tr '_' ' ' | awk '{for (i=1; i<=NF; ++i) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
        zet+=("$name")
    fi
done

ch=$(printf "%s\n" "${zet[@]}" | wofi --cache-file=/dev/null --show dmenu -i)

for i in $raw
do
    j=$(echo "$i" | tr '_' ' ' | awk '{for (i=1; i<=NF; ++i) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
    if [ "$ch" == "$j" ]
    then
        if [ -d "$HOME/zettelkasten/current" ]
        then
            rm $HOME/zettelkasten/current
        fi
 
        ln -s $HOME/zettelkasten/"$i" $HOME/zettelkasten/current
        exit 0
    fi
done
