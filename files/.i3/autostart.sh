#!/bin/bash

xsetroot -solid black
setxkbmap -model "microsoft" -layout "us,cz" -variant ",qwerty" -option "grp:alt_shift_toggle"
/usr/bin/numlockx on

[ -f "/usr/bin/skype" ] && /usr/bin/skype &
[ -f "/usr/bin/rescuetime" ] && /usr/bin/rescuetime &
[ -f "/usr/bin/parcellite" ] && /usr/bin/parcellite -d &
[ -f "/usr/bin/AMDOverdriveCtrl" ] && /usr/bin/AMDOverdriveCtrl -m &
[ -f "/usr/bin/fluxgui" ] && /usr/bin/fluxgui &
