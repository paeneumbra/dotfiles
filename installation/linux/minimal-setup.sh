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

# Minimal installation for dotfiles setup

PKGS=(
  # Apps
  alacritty
  bat
  fd
  fzf
  git
  go-task
  neovim
  openssh
  yazi
  ripgrep
  starship
  stow
  wezterm
  zsh
)

for PKG in "${PKGS[@]}"; do
  print_info "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

# In linux, task is called go-task, to allow it to run normally is necessary to create a symlink.
# This might break other apps like taskwarrior
echo
print_info "Symlinking taskfile"
print_info "This might break other apps like taskwarrior"
print_info "INFO: to revert the symlink: sudo rm /usr/bin/task"
sudo ln -s /usr/bin/go-task /usr/bin/task

echo
print_info "Minimal installation done successfully"
echo
