#!/bin/sh

# Colors
GREY="#666666"

battery_str() {
	acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
		read -r status capacity

		if [ $status == "Discharging" ]
		then
			echo "$capacity% %{F$GREY}  %{F-}"
		else
			echo "$capacity%    "
		fi
	}
}


date_str() {
	echo "$(date "+%A, %B %d · %R %Z")"
}


volume_str() {
	volume=$(pamixer --get-volume)
	if [ $(pamixer --get-volume-human) == "muted" ]
	then
		echo "  %{F$GREY}  %{F-}$volume%"
	else
		echo "    $(pamixer --get-volume-human)"
	fi
}


while true; do
	echo "%{l}$(volume_str)%{c}$(date_str)%{r}$(battery_str)"
	sleep 1;
done
