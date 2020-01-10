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
			echo "$capacity%   "
		fi
	}
}


date_str() {
	echo "$(date "+%A, %B %d · %R %Z")"
}


desktop_str() {
	bspc wm -g | awk -F'[:]' '{print $2, $3, $4, $5, $6}' | {
		read -r desk1 desk2 desk3 desk4 desk5

		OUTPUT=""
		for i in {1..5}; do
			DESKSTATUS="$(eval "echo \$desk$i")"
			DESKSTATUS="${DESKSTATUS:0:1}"

			if [ $DESKSTATUS = "O" ] || [ $DESKSTATUS = "F" ] || [ $DESKSTATUS = "U" ] ; then
				OUTPUT="$OUTPUT $i"

			elif [ $DESKSTATUS = "o" ] || [ $DESKSTATUS = "u" ]; then
				OUTPUT="$OUTPUT%{F$GREY} $i%{F-}"

			fi
		done

	echo $OUTPUT
	}
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


openvpn_str() {
	if [ $(pgrep -x openvpn) ]
	then
		echo "   "
	else
		echo " %{F$GREY}  %{F-}"
	fi
}


while true; do
	echo "%{l}$(volume_str) %{c}$(desktop_str) | $(date_str) $(openvpn_str)%{r}$(battery_str)"
	sleep 1;
done
