#!/bin/bash

set -e

PKGS=(
  dkms
  xorg-server
  xorg-xinit
  nvidia-dkms
  nvidia-settings
  nvidia-utils
  mesa-utils
  vulkan-intel

  #Lua based WM
  #https://wiki.archlinux.org/title/Awesome
  awesome-git
  picom
  rofi

  # Tools
  bluetuith
  brightnessctl

  # Terminals
  wezterm
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
