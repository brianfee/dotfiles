#!/usr/bin/sh

killall -q lemonbar

while pgrep -u $UID -x lemonbar > /dev/null;do sleep 1; done

width=`xdpyinfo | awk '/dimensions:/ { print $2 }' | tr "x" "\n" | head -n 1`
geom=$width"x64"

eval $@ | lemonbar -p \
	-g $geom \
	-f "FontAwesome:size=12" \
	-f "Noto Sans:style=bold:size=8.5" \
