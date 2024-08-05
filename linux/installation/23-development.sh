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
  #JVM
  # Java and other jvm tools are installed via sdkman
  ktlint

  # Lua
  lua
  luarocks
  stylua

  # IDE
  intellij-idea-community-edition
  pycharm-community-edition
  visual-studio-code-bin

  # Docker
  docker
  docker-compose

  # Python
  python
  python-pip
  python-pipx
  python-virtualenv
  python-pipenv
  python-pynvim
  python-setuptools
  python-black
  python-ruff
  python-pre-commit
  python-cookiecutter
  pip-tools

  # Misc
  cargo
  jq
  yq
  slack-desktop
)

PIPX=(
  commitizen
  poetry
)

print_info "Installing Development required packages"

for PKG in "${PKGS[@]}"; do
  echo
  print_info "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

for PKG in "${PIPX[@]}"; do
  echo
  print_info "INSTALLING PIPX PACKAGE: $PKG"
  pipx install "$PKG"
done

pipx ensurepath

print_info "Inject poetry plugin export"
pipx inject poetry poetry-plugin-export

print_info "Development setup is complete"
