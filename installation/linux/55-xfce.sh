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
  #https://wiki.archlinux.org/title/Xfce
  xfce4
  thunar
  thunar-archive-plugin
  thunar-volman
  tumbler

  # Theme
  qogir-gtk-theme
)

print_info "Installing gnome required packages"

for PKG in "${PKGS[@]}"; do
  print_info "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

print_info "Gnome setup is complete"
