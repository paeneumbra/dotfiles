#!/bin/bash

set -e

PKGS=(
  # Graphic Drivers
  dkms
  xorg-server
  xorg-xinit
  nvidia-dkms
  nvidia-prime
  lib32-nvidia-utils
  nvidia-utils
  mesa-utils
  vulkan-intel

  # Basic Apps
  alacritty
  arandr
  rxvt-unicode
  fd
  feh
  fzf
  fwupd
  git
  git-filter-repo
  glow
  maim
  neofetch
  openssh
  ranger
  ripgrep
  starship
  stow
  tree
  wmname
  tlp
  ueberzug
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
