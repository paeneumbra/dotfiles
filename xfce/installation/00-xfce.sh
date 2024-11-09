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

# Base packages to install

PKGS=(
  #https://wiki.archlinux.org/title/Xfce
  #https://archlinux.org/groups/x86_64/xfce4/
  xfce4
  #required for thunar
  gvfs
  thunar-archive-plugin
)

for PKG in "${PKGS[@]}"; do
  print_info "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
print_info "Default packages installed successfully"
echo
