#!/usr/bin/env bash

spaces () {
  WORKSPACE_WINDOWS=$(hyprctl workspaces -j | jq 'map({key: .id | tostring, value: .windows}) | from_entries')
  FOCUSED_WS=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .activeWorkspace.id | tostring')

  seq 1 10 | jq --argjson windows "${WORKSPACE_WINDOWS}" --arg focused "$FOCUSED_WS" --slurp -Mc '
    map(tostring)
    | map({id: ., windows: ($windows[.]//0)})
    | map(select(.windows > 0 or .id == $focused))
  '
}

spaces
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  spaces
done

