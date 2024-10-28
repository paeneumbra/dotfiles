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
  calibre
  firefox
  git-extras
  mullvad-vpn-bin
  obsidian
  seahorse
  skypeforlinux-bin
  spotify-launcher
  thunderbird
  ticktick
  tldr
  vivaldi
  vlc

  # Fonts
  noto-fonts
  noto-fonts-emoji
  ttf-fira-code
  ttf-iosevka
  ttf-iosevka-nerd
  ttf-iosevkaterm-nerd
  ttf-material-design-icons-webfont
  ttf-roboto

  #https://wiki.archlinux.org/title/GNOME
  #https://archlinux.org/groups/x86_64/gnome/
  baobab
  cheese
  seahorse
  gnome-disk-utility
  gnome-font-viewer
  gvfs
  xdg-user-dirs-gtk

  #xfce
  thunar
  thunar-archive-plugin
  thunar-volman
  tumbler
)

print_info "Installing productivity related packages"

for PKG in "${PKGS[@]}"; do
  print_info "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

print_info "Productivity setup is complete"
