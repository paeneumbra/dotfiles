#!/bin/bash

set -e

PKGS=(
  alacritty
  fd
  fzf
  git
  git-filter-repo
  openssh
  ripgrep
  starship
  stow
  tree
  zsh
  zsh-completions

  neovim
  prettier
  npm

  ranger
  ueberzug

  zathura
  zathura-cb
  zathura-pdf-mupdf

  glow
  neofetch

  ttf-fira-code
  noto-fonts

  intellij-idea-community-edition
  jre8-openjdk
  jre11-openjdk
  jre17-openjdk
  kotlin
  gradle
  groovy

  lua
  luarocks
  stylua

  python
  python-pip
  python-virtualenv
  python-pipenv
  python-setuptools
  pycharm-community-edition
  python-black
  flake8

  jq
  yq

  firefox
  thunderbird
  zsa-wally
  calibre

  tlp
  fwupd
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
