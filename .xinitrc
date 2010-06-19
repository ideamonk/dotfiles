#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec fvwm
#exec awesome
#exec fluxbox

# try for lcd
xrandr -s 1920x1080 &

~/bin/mympd.sh &
~/bin/myconky.sh &
~/bin/mywall.sh &

exec /usr/local/bin/dwm-launch

