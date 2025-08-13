xset s off
xset -dpms
setxkbmap -layout us -variant intl
xset r rate 200 40
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
exec i3
