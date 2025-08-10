#!/usr/bin/env bash

DEVICE_MAC="BC:A0:80:2C:AA:18"
DEVICE_ID=$(upower -e | grep "$(echo "$DEVICE_MAC" | tr ':' '_')")

print_battery() {
    inf=$(upower --dump)
    model=$(echo "$inf" | awk -v mac="$DEVICE_MAC" '$1 == "model:" {model = substr($0, index($0, $2))} $1 == "serial:" && $2 == mac {print model; exit}'
    )
    perc=$(echo "$inf" | awk -v dev="$DEVICE_MAC" '
    $0 ~ dev {
        for(i=1;i<=7;i++) {
            getline
            if ($1=="percentage:") {
                sub(/%$/, "", $2)
                print $2
                exit 0
            }
        }
    }')

    if [[ -z "$model" ]]
    then
        printf "{\"device\":\"%s\",\"status\":\"disconnected\"}\n" "$DEVICE_MAC"
    else
        printf "{\"device\":\"%s\",\"status\":\"connected\",\"percentage\":\"%s\"}\n" "$model" "$perc"
    fi
}

print_battery
upower --monitor-detail | while read -r line
do
    if echo "$line" | grep -q "$DEVICE_ID"
    then
        print_battery
    fi
done
