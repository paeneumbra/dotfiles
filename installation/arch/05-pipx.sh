#!/bin/bash

set -e

PKGS=(
    commitizen
)

for PKG in "${PKGS[@]}"; do
	echo
	echo "INSTALLING PIPX PACKAGE: $PKG"
	pipx install "$PKG"
done

echo
echo "Installation is done"
echo
