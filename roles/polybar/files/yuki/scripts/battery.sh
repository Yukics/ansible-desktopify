#!/bin/sh

upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -d: -f2 | xargs