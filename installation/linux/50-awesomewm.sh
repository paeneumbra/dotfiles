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

PKGS=(
  #Lua based WM
  #https://wiki.archlinux.org/title/Awesome
  awesome-git
  arandr
  bluetuith
  brightnessctl
  networkmanager
  picom
  yazi
  redshift
  rofi
  xorg-xrandr
  xtitle
)

print_info "Installing Awesome required packages"

print_info "This installation requires uninstalling awesome before replacing with AUR awesome git!"
print_info "Do you want to continue? (y/n) "
read answer

if [ "$answer" != "${answer#[Yy]}" ]; then
  print_info "Continuing with the installation"
else
  print_info "You declined to install awesome git!"
  exit 0
fi

for PKG in "${PKGS[@]}"; do
  print_info "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

#print_info "Symlinking with stow"
#
#stow --restow --verbose --dir="$HOME/anvil" --target="$HOME" awesome

print_info "Awesome setup is complete"
