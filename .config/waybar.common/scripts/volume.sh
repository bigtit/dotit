#!/bin/bash
#

if [[ "$1" == "mute" ]]; then
    ./wob.sh $(pactl set-sink-mute @DEFAULT_SINK@ toggle && pactl get-sink-mute @DEFAULT_SINK@ | sed -En "/no/ s/.*/$(${sink_volume})/p; /yes/ s/.*/0/p")
    exit 0;
fi

if [[ "$1" == "down" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [[ "$1" == "up" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
fi
./wob.sh $(pactl get-sink-volume @DEFAULT_SINK@ | grep '^Volume:' | cut -d / -f 2 | tr -d ' ' | sed 's/%//')
