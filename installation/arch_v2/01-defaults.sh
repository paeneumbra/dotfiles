#!/bin/bash

set -uo pipefail

# Define some colors for output
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

# Print an info message
function print_info() {
  echo -e "${GREEN}$1${RESET}"
}

# Minimal default packages to install

PKGS=(
  base-devel
  dkms
  nvidia-dkms
  nvidia-utils
  xorg-server
  xorg-xinit

  # Apps
  alacritty
  arandr
  bat
  bluez
  bluez-utils
  bluez-hid2hci
  bottom
  fd
  feh
  figlet
  firefox
  fwupd
  fzf
  git
  git-filter-repo
  lazygit
  maim
  neofetch
  neovim
  networkmanager
  openssh
  ranger
  ripgrep
  rxvt-unicode
  starship
  stow
  tlp
  tree
  xclip
  wezterm
  zsh
)

for PKG in "${PKGS[@]}"; do
  echo
  print_info "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
print_info "Default packages installed successfully"
echo
