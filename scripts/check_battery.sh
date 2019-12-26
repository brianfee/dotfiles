#!/usr/bin/sh

LOWBATT=10

batt=$(acpi -b | awk -F'[,:%]' '{print $3}')

if [ $batt -le $LOWBATT ]
then
	$(notify-send -u CRITICAL "WARNING: Low Battery - $batt%")
fi

touch ~/battery_check
