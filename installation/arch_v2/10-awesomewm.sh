#!/bin/bash

set -uo pipefail

# Define some colors for output
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

# Print an info message
function print_info() {
  echo -e "${GREEN}$1${RESET}"
}

PKGS=(
  #Lua based WM
  #https://wiki.archlinux.org/title/Awesome
  awesome-git
  arandr
  bluetuith
  brightnessctl
  networkmanager
  picom
  ranger
  redshift
  rofi
  xrandr
  xtitle
)

print_info "Installing Awesome required packages"

for PKG in "${PKGS[@]}"; do
  echo
  print_info "Installing package: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

print_info "Symlinking with stow"

stow --restow --verbose --dir="$HOME/workspace" --target="$HOME" awesome

print_info "Initializing awesome submodules"
git submodule update --init "$HOME/workspace/awesome/.config/awesome/modules/bling/"

print_info "Awesome setup is complete"
