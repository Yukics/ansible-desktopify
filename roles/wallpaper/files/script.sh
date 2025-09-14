#!/bin/bash

ROTATE_MIN=15
if [[ "$1x" != "x" ]]
then
    ROTATE_MIN=$1
fi

wallpaper_rotate(){   
    for wallpaper in $(ls ~/.config/wallpapers | grep -v "script" | sort -R --random-source=/dev/zero); do
        feh --bg-fill ~/.config/wallpapers/$wallpaper
        sleep $((60*$ROTATE_MIN))
    done
}

while true; do
    wallpaper_rotate
done