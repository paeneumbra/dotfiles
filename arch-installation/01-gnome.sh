#!/bin/bash

set -e

PKGS=(
  # My Basic Gnome
  #https://wiki.archlinux.org/title/GNOME
  #https://archlinux.org/groups/x86_64/gnome/
  baobab
  cheese
  gnome-control-center
  gnome-font-viewer
  gnome-session
  gnome-settings-daemon
  gnome-shell
  gnome-shell-extensions
  mutter
  tracker3-miners
  xdg-user-dirs-gtk
  gnome-tweaks

  #xfce
  thunar
  tumbler
  thunar-volman
  thunar-archive-plugin

  bluetuith
  xtitle
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
