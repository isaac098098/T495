#!/usr/bin/env bash

print_info() {
    inf=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0) 
    perc=$(echo "$inf" | awk '/percentage:/ { gsub("%", "", $2); print $2 }') 
    state=$(echo "$inf" | awk '/state:/ { print $2 }')
    timeempty=$(echo "$inf" | awk -F': *' '/time to empty:/ { print $2 }')
    timefull=$(echo "$inf" | awk -F': *' '/time to full:/ { print $2 }')
    if [[ $perc == 10 ]] && [[ "$state" != "charging" ]]
    then
        notify-send "LOW BATTERY!" "Less than 10% battery"
    fi
    printf "{\"percentage\":\"%s\",\"state\":\"%s\",\"timeempty\":\"%s\",\"timefull\":\"%s\"}\n" "$perc" "$state" "$timeempty" "$timefull"
}

upower --monitor | while read -r _
do
    print_info
done
