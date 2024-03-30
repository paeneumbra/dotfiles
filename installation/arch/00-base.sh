#!/bin/bash

set -e

PKGS=(
  # Graphic Drivers
  # Check nvidia is working with "prime-run glxinfo | grep "OpenGL renderer""
  dkms
  lib32-nvidia-utils
  mesa-utils
  nvidia-dkms
  nvidia-prime
  nvidia-utils
  vulkan-intel
  xorg-server
  xorg-xinit

  # Apps
  alacritty
  arandr
  bat
  bottom
  fd
  feh
  fwupd
  fzf
  git
  git-filter-repo
  glow
  handlr-regex
  lazygit
  maim
  neofetch
  neovim
  openssh
  ranger
  ripgrep
  rxvt-unicode
  shellcheck
  starship
  stow
  tlp
  tree
  ueberzug
  wmname
  xclip
  zoxide
  zathura
  zathura-cb
  zathura-pdf-mupdf
  zsh
  zsh-completions
  wezterm
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
