#!/bin/bash

set -uo pipefail

# Define some colors for output
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

# Print an info message
function print_info() {
  echo -e "${GREEN}$1${RESET}"
}

print_info "Enabling keychron keyboard"
print_info "https://github.com/adam-savard/keyboard-function-keys-linux"
sudo cp "$HOME/workspace/installation/arch/extras/keychron.service" /etc/systemd/system/
sudo systemctl enable --now keychron

print_info "Keyboard setup is complete"
