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
  alacritty
  neofetch
  ranger
  wezterm
  picom
  redshift
  rofi
  zathura
  zathura-cb
  zathura-pdf-mupdf
  handlr
)

print_info "Installing stow configuration required packages"

for PKG in "${PKGS[@]}"; do
  echo
  print_info "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

print_info "Stow configuration"
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.local/bin"
stow --restow --verbose --dir="$HOME/anvil/linux" --target="$HOME" dotfiles
stow --restow --verbose --dir="$HOME/anvil" --target="$HOME" base

print_info "copy gtk files"
rm -rf "$HOME/.config/mimeapps.list"
cp "$HOME/anvil/installation/linux/extras/mimeapps.list" "$HOME/.config/"
rm -rf "$HOME/user-dirs"
cp "$HOME/anvil/installation/linux/extras/user-dirs.dirs" "$HOME/.config/"

print_info "Initializing ranger submodules"
git submodule update --init "$HOME/anvil/base/.config/ranger/plugins/ranger-zoxide/"
git submodule update --init "$HOME/anvil/base/.config/ranger/plugins/ranger-devicons2/"

print_info "Stow configuration setup is complete"
