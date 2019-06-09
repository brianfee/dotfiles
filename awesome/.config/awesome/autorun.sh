#!/usr/bin/env bash

function run {
	if ! pgrep $1 ;then
		$@ &
	fi
}

run ~/.fehbg

run compton

# Caps lock is set to escape
setxkbmap -option caps:escape
