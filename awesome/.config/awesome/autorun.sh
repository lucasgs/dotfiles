#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom --config  $HOME/.config/picom/picom.conf
run thunar --daemon
#·run udiskie --no-automount --no-notify --tray
run nitrogen --restore
run nm-applet
#run blueman-applet
run blueman-tray
run volumeicon

