#!/bin/bash

discrete() {
	killall Xorg
	modprobe nvidia_drm
	modprobe nvidia_modeset
	modprobe nvidia
	tee /proc/acpi/bbswitch <<<ON
	cp /etc/X11/xorg.conf.nvidia /etc/X11/xorg.conf
}

integrated() {
	killall Xorg
	rmmod nvidia_drm
	rmmod nvidia_modeset
	rmmod nvidia
	tee /proc/acpi/bbswitch <<<OFF
	cp /etc/X11/xorg.conf.intel /etc/X11/xorg.conf
}

case $@ in
-d)
	discrete
	;;
--discrete)
	discrete
	;;
--dgpu)
	discrete
	;;
-i)
	integrated
	;;
--integrated)
	integrated
	;;
--igpu)
	integrated
	;;
