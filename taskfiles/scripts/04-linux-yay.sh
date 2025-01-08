#!/bin/bash

set -uo pipefail

# Define yay directory
YAY_DIR="$HOME/foundry/depository/yay"

# Create the directory if it doesn't exist
mkdir -p "$YAY_DIR"

# Clone the repository
git clone https://aur.archlinux.org/yay.git "$YAY_DIR"

# Navigate to the directory and run makepkg -si
cd "$YAY_DIR" && makepkg -si

# Enable development packages update
# https://github.com/Jguer/yay?tab=readme-ov-file#first-use
yay -Y --devel --save

echo
echo "Yay setup successfully"
echo
