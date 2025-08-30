#!/bin/bash

set -uo pipefail

PKGS=(
  ollama
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  paru -S "$PKG" --noconfirm --needed
done
