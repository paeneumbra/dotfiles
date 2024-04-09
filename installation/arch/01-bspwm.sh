#!/bin/bash

set -e

# Note configurations for bspwm were removed in favor of awesome wm
# this file is deprecated

PKGS=(
  #https://wiki.archlinux.org/title/Bspwm
  bluetuith
  bspwm
  dmenu
  dunst
  light
  pavucontrol
  picom
  polybar
  rofi
  rxvt-unicode
  sxhkd
  xdo
  xtitle

  #https://wiki.archlinux.org/title/GNOME
  #https://archlinux.org/groups/x86_64/gnome/
  baobab
  cheese
  gnome-disk-utility
  gnome-font-viewer
  xdg-user-dirs-gtk

  #xfce
  thunar
  thunar-archive-plugin
  thunar-volman
  tumbler
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
