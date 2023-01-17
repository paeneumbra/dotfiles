#!/bin/sh

sleep 1
pgrep picom > /dev/null && pkill picom
sleep 1
picom --config /home/archy/.config/picom/picom.conf & disown
killall redshift; sleep 4; redshift &
