xset s off
xset -dpms
setxkbmap -layout us -variant intl
xset r rate 200 40
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
xinput set-prop "TPPS/2 ALPS TrackPoint" "Device Enabled" 0
$HOME/.local/bin/battery.sh &
dunst &
exec i3
