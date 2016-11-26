#!/bin/bash

xsetroot -solid black
setxkbmap -model "microsoft" -layout "us,cz" -variant ",qwerty" -option "grp:alt_shift_toggle"
/usr/bin/numlockx on

>> /dev/null which nm-applet && nm-applet &
>> /dev/null which udiskie && udiskie &
>> /dev/null which skype && skype &
>> /dev/null which rescuetime && rescuetime &
>> /dev/null which AMDOverdriveCtrl && AMDOverdriveCtrl -m &
>> /dev/null which fluxgui && fluxgui &
