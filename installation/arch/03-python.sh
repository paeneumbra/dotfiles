#!/bin/bash

set -e

PKGS=(
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
)

PIPX=(
  commitizen
  poetry
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

for PKG in "${PIPX[@]}"; do
  echo
  echo "INSTALLING PIPX PACKAGE: $PKG"
  pipx install "$PKG"
done

echo "Inject poetry plugin export"
pipx inject poetry poetry-plugin-export

echo
echo "Installation is done"
echo
