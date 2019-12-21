#!/bin/sh

battery_str() {
	acpi -b | awk -F'[,:%]' '{print $3}' | {
		read -r capacity

		echo "$capacity%    "
	}
}


date_str() {
	echo "$(date "+%A, %B %d · %R %Z")"
}


volume_str() {
	echo "    $(pamixer --get-volume-human)"
}


while true; do
	echo "%{l}$(volume_str)%{c}$(date_str)%{r}$(battery_str)"
	sleep 1;
done
