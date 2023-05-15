#!/bin/bash

set -e

PKGS=(
  # Graphic Drivers
  dkms
  lib32-nvidia-utils
  mesa-utils
  nvidia-dkms
  nvidia-prime
  nvidia-utils
  vulkan-intel
  xorg-server
  xorg-xinit

  # Basic Apps
  alacritty
  arandr
  bottom
  fd
  feh
  fwupd
  fzf
  git
  git-filter-repo
  glow
  maim
  neofetch
  openssh
  ranger
  ripgrep
  rxvt-unicode
  starship
  stow
  tlp
  tlpui
  tree
  ueberzug
  wmname
  xclip
  zathura
  zathura-cb
  zathura-pdf-mupdf
  zsh
  zsh-completions
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
