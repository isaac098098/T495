#!/bin/bash

threshold=10
stat_file="/tmp/battery_notifier"

acpi_listen | while read -r _
do
    bat_info=$(acpi -b | head -n1)
    percent=$(printf '%s\n' "$bat_info" | grep -o '[0-9]\+%' | tr -d '%')
    status=$(printf '%s\n' "$bat_info" | cut -d: -f2 | cut -d, -f1 | tr -d ' ')

    if [ "$status" -eq "Discharging" ]
    then
        if [ "$percent" -le "$threshold" ] && [ ! -f "$state_file" ]
        then
            notify-send "Low battery" "less than 10%"
            touch "$state_file"
        fi
    else
        rm -f "$state_file"
    fi
done
