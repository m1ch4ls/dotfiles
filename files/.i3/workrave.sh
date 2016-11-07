#!/bin/bash

SESSION_BUS="org.workrave.Workrave"

METHOD_ROOT="/org/workrave/Workrave"
CORE_INTERFACE="$METHOD_ROOT/Core org.workrave.CoreInterface"
CONTROL_INTERFACE="$METHOD_ROOT/UI org.workrave.ControlInterface"
APPLET_INTERFACE="$METHOD_ROOT/UI org.workrave.AppletInterface"
CONFIG_INTERFACE="$METHOD_ROOT/Core org.workrave.ConfigInterface"

try() {
	if [ -z "$1" ]; then
		exit
	fi
	if ! ret=$(qdbus $SESSION_BUS $@) ; then
		kdialog --error "$(echo "$ERROR\n$@")"
		clean_up
		kill $$
	fi
	echo $ret
}

seconds_to_readable() {
	local secs="$1"
	h=$((secs/3600))
	m=$((secs%3600/60))
	s=$((secs%60))
	if [ "$h" -gt 0 ]; then
		printf "%02d:" "$h"
	fi
	printf "%02d:%02d" "$m" "$s"
}

progress() {
	local _status=$1
	local _total=$2
	local _progress=$(((_status*100/_total*100)/100))
	local _done=$(((_progress*4)/10))
	local _left=$((40-_done))
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")

	printf "[${_done// /=}${_left// / }]"
}

restbreak_limit="$(try "$CONFIG_INTERFACE.GetInt" "timers/rest_break/limit" |tr -d [:blank:][:alpha:])"
restbreak_current="$(try "$CORE_INTERFACE.GetTimerElapsed" "restbreak")"
next_restbreak=$((restbreak_limit - restbreak_current))

if [ $restbreak_current -gt 0 -a $restbreak_current -lt $restbreak_limit ]; then
	echo "$(progress $restbreak_current $restbreak_limit) $(seconds_to_readable "$next_restbreak")"
else
	echo "Break time!"
fi
