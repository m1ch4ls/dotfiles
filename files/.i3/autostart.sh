#!/bin/bash

xsetroot -solid black
setxkbmap -model "microsoft" -layout "us,cz" -variant ",qwerty" -option "grp:alt_shift_toggle"
/usr/bin/numlockx on

[ -f "/usr/bin/skype" ] && /usr/bin/skype &
[ -f "~/bin/rescuetime" ] && ~/bin/rescuetime &
[ -f "/usr/bin/parcellite" ] && /usr/bin/parcellite -d &
[ -f "/usr/bin/AMDOverdriveCtrl" ] && /usr/bin/AMDOverdriveCtrl -m &
[ -f "/usr/local/bin/fluxgui" ] && /usr/local/bin/fluxgui &
