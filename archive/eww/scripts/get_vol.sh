#!/usr/bin/env bash

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '/Volume/ { gsub(/[^0-9]/, "", $2); print $2; exit }')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')
printf '{"vol": %d, "mute": "%s"}\n' "$volume" "$mute"

pactl subscribe | while read -r line
do
  if echo "$line" | grep -qE "Event 'change' on sink|Event 'change' on sink-input|Event 'new' on sink-input"
  then
      volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '/Volume/ { gsub(/[^0-9]/, "", $2); print $2; exit }')
      mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')
      printf '{"vol": %d, "mute": "%s"}\n' "$volume" "$mute"
  fi
done


