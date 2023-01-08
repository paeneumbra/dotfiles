#!/bin/sh

sleep 1
pgrep picom > /dev/null && pkill picom
picom --config /home/archy/.config/picom/picom.conf & disown
sh -c './screen-layout.sh'
killall redshift; sleep 4; redshift &
