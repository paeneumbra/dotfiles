#!/usr/bin/env bash

# Picom
picom --config "$HOME/.config/picom/picom.conf" &

dunst &

pkill redshift

redshift &
