#!/usr/bin/env zsh

set -uo pipefail

# Define some colors for output
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

# Print an info message
function print_info() {
  echo -e "${GREEN}$1${RESET}"
}

## https://sdkman.io/
print_info "Installing sdkman"

if [[ ! -d "$HOME/.sdkman" ]]; then
    curl -fsSL "https://get.sdkman.io" | bash
else
  print_info ">> SDKMAN is already installed"
  print_info ">> SDKMAN_DIR = $SDKMAN_DIR"
fi

print_info "source sdkman"
if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"

    # DEBUG
    # print_info "DEBUG: All SDKMAN environment variables"
    # printenv | grep SDKMAN_

    print_info "sdkman version"
    zsh -c "sdk version"
else
    echo "ERROR: SDKMAN initialization script not found or empty."
    exit 1
fi

print_info "Unset java"
sudo archlinux-java unset

# print_info "Force update sdkman"
# zsh -c "sdk selfupdate force"

if [[ "$(command -v sdk)" ]]; then
  source "$SDKMAN_DIR"/bin/sdkman-init.sh
  print_info "Installing gradle groovy java11 java17 java21 java22 kotlin maven scala"
  zsh -c "sdk install gradle"
  zsh -c "sdk install groovy"
  zsh -c "sdk install java 11.0.24-tem"
  zsh -c "sdk install java 17.0.12-tem"
  zsh -c "sdk install java 21.0.4-tem"
  zsh -c "sdk install java 22.0.2-tem"
  zsh -c "sdk install kotlin"
  zsh -c "sdk install maven"
  zsh -c "sdk install scala"
else
  print_info "Command sdk not found. Is zsh configured correctly?"
fi

print_info "to disable compinit error from zsh, modify .sdkman/etc/config sdkman_auto_complete=false"

print_info "sdkman setup is complete"
