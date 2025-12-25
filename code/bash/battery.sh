#!/bin/bash

bat="/sys/class/power_supply/BAT0"
threshold=10
state_file="/tmp/battery_notifier"

acpi_listen | while read -r _
do
    percent=$(cat "$bat/capacity")
    status=$(cat "$bat/status")

    if [ "$status" == "Discharging" ]
    then
        if [ "$percent" -le "$threshold" ] && [ ! -f "$state_file" ]
        then
            notify-send "Low battery" "less than 10%"
            touch "$state_file"
        fi
    else
        if [ -f "$state_file" ]
        then
            rm -f "$state_file"
        fi
    fi
done
