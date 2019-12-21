#!/usr/bin/sh

killall -q lemonbar

while pgrep -u $UID -x lemonbar > /dev/null;do sleep 1; done

eval $@ | lemonbar -p \
	-g 3840x64 \
	-f "FontAwesome:size=12" \
	-f "Noto Sans:style=bold:size=8.5" \
