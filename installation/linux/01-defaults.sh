#!/bin/bash

set -uo pipefail

# Define some colors for output
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

# Print an info message
function print_info() {
  echo
  echo -e "${YELLOW}$1${RESET}"
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
  go-task
  handlr
  lazygit
  maim
  man-db
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
  unzip
  xclip
  wezterm
  zoxide
  zsh
)

for PKG in "${PKGS[@]}"; do
  print_info "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
print_info "Default packages installed successfully"
echo
