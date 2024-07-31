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
  #https://wiki.archlinux.org/title/GNOME
  #https://archlinux.org/groups/x86_64/gnome/
  #https://archlinux.org/groups/x86_64/gnome-extra/
  baobab
  cheese
  seahorse
  gnome-control-center
  gnome-disk-utility
  gnome-font-viewer
  gnome-session
  gnome-settings-daemon
  gnome-shell
  gnome-tweaks
  mutter
  xdg-user-dirs-gtk
)

print_info "Installing qtile required packages"

for PKG in "${PKGS[@]}"; do
  echo
  print_info "Installing package: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

print_info "Symlinking with stow"

stow --restow --verbose --dir="$HOME/workspace" --target="$HOME" qtile

print_info "Qtile setup is complete"
