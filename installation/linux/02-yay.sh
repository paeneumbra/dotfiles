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

# Define yay directory
YAY_DIR="$HOME/foundry/depository/yay"

# Create the directory if it doesn't exist
mkdir -p "$YAY_DIR"

# Clone the repository
git clone https://aur.archlinux.org/yay.git "$YAY_DIR"

# Navigate to the directory and run makepkg -si
cd "$YAY_DIR" && makepkg -si

echo
print_info "Yay setup successfully"
echo
