#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb -merge ~/.Xresources &
xscreensaver -no-splash &
export GTK2_RC_FILES="$HOME/.gtkrc-2.0" &

#exec ck-launch-session startkde
exec ck-launch-session dbus-launch openbox-session
