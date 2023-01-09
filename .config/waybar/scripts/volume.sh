#!/bin/bash
#
WOBSOCK=~/.cache/wob.sock

if [[ "$1" == "mute" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [[ "$1" == "down" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [[ "$1" == "up" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
fi
# ./wob.sh $(pactl get-sink-volume @DEFAULT_SINK@ | grep '^Volume:' | cut -d / -f 2 | tr -d ' ' | sed 's/%//')
# pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK
