#!/bin/bash

BATTINFO=$(acpi -b)

PERCENT=$(echo $BATTINFO | cut -d ' ' -f 4 | cut -c -2) 

if [[ $(echo $BATTINFO | grep Discharging) && PERCENT -lt 15 ]] ; then
	DISPLAY=:0.0 /usr/bin/i3-nagbar -m  "LOW BATTERY $PERCENT%" -f "pango:Droid Sans Mono 15"
fi

