#!/bin/sh

DIR='/tmp/lemonbar'

destructor() {
	echo "Removing tmp directory."
	sleep 3
	rm -r $DIR
	exit
}


battery_str() {
	pipe="$DIR/batt.fifo"
	mkfifo "$pipe"

	while true; do
		cat "$pipe"
	done
}


trap 'destructor' SIGINT SIGKILL

mkdir -p $DIR

battery_text=$(battery_str &)
while true; do
	echo battery_text
	sleep 1;
done
