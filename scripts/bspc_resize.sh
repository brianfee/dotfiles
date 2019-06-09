#!/bin/bash


check_direction() {
	dir_node=$(bspc query -N -n $1)
	if [ "$dir_node" == "" ]; then
		echo shrink
	else
		echo expand
	fi
}
		
if [ $(check_direction $1) == "shrink" ]; then
	case $1 in
		north)
			bspc node -z bottom 0 $2
			;;
		south)
			bspc node -z top 0 $2
			;;
		west)
			bspc node -z right -$2 0
			;;
		east)
			bspc node -z left $2 0
			;;
	esac
else
	case $1 in
		north)
			bspc node -z top 0 -$2
			;;
		south)
			bspc node -z bottom 0 $2
			;;
		west)
			bspc node -z left -$2 0
			;;
		east)
			bspc node -z right $2 0
			;;
	esac
fi
