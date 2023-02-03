#!/bin/bash

set -e

PKGS=(
  # Neovim
  neovim
  prettier
  npm

  # Java
  jre8-openjdk
  jre11-openjdk
  jdk11-openjdk
  jre17-openjdk
  jdk17-openjdk
  kotlin
  gradle
  groovy

  # Lua
  lua
  luarocks
  stylua

  # Python
  python
  python-pip
  python-virtualenv
  python-pipenv
  python-pynvim
  python-setuptools
  python-black
  pip-tools
  flake8

  # IDE
  intellij-idea-community-edition
  pycharm-community-edition
  vscodium-bin
  zsa-wally

  # Misc
  jq
  yq
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
