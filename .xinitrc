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

# Dzen & conky
(sleep 3&&conky | dzen2 -x '544' -e '' -fg '#737373' -bg '#262626' -w '490' -h '14' -ta r -fn '-*-fixed-medium-r-*-*-12-*-*-*-*-*-iso8859-*' -p  ) &
xrandr -s 1920x1080 &
/home/ideamonk/bin/feh /home/ideamonk/Pictures/walls/Samurai_Revolution_by_Orioto.jpg &
exec /usr/local/bin/dwm-launch

