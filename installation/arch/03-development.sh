#!/bin/bash

set -e

PKGS=(
  # Neovim
  npm

  #JVM
  # Moved to /03-sdkman.zsh
  ktlint

  # Lua
  lua
  luarocks
  stylua

  # Python
  # Moved to 03-python.sh

  # IDE
  intellij-idea-community-edition
  pycharm-community-edition
  visual-studio-code-bin

  # Docker
  docker
  docker-compose

  # Misc
  cargo
  jq
  yq
  slack-desktop
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
