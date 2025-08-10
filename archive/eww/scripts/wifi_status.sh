#!/usr/bin/env bash

print_status() {
    wifi_dev=$(nmcli -t -f DEVICE,TYPE,STATE dev | grep '^.*:wifi:connected' | cut -d: -f1)
    if [ -n "$wifi_dev" ]; then
        ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
        dev=$(nmcli -t -f DEVICE,TYPE,STATE dev | grep ':wifi:connected' | cut -d: -f1)
        ip=$(ip -4 addr show "$dev" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
        printf "{\"status\":\"connected\",\"ssid\":\"%s\",\"ip\":\"%s\"}\n" "$ssid" "$ip"
    else
        printf "{\"status\":\"disconnected\",\"ssid\":\"\",\"ip\":\"\"}\n"
    fi
}

print_status
dbus-monitor --system "type='signal',interface='org.freedesktop.NetworkManager'" 2>/dev/null |
while read -r line; do
    if echo "$line" | grep -qE 'StateChanged|PropertiesChanged|Device'; then
        print_status
    fi
done

