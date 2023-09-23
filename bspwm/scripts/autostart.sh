#!/bin/bash

# This is a script to autostart some applications like picom
# or merge some Xresources or change the wallpaper, or in This
# case is necesary to start sxhkd

#  NOTE: This is an example file, you can change it with your stuff

xsetroot -cursor_name left_ptr
picom -b
xrdb -merge $HOME/.Xresources

launch_sxhkd() {
	sxhkd &
}


# notification manager
launch_sxhkd
dunst &

# Wallpaper
pkill polybar
polybar -c $HOME/.config/polybar/config.ini example &  
polybar -c $HOME/.config/polybar/config.ini hdmi &
# don't remove this please
pkill bspc
pkill eww

$HOME/scripts/bg.sh &
pkill sxhkd
launch_sxhkd
