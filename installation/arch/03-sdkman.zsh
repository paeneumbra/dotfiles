#!/usr/bin/env zsh

set -o pipefail

## https://sdkman.io/
echo "Installing sdkman"
if [[ ! -d "$HOME/.sdkman" ]]; then
    curl -fsSL "https://get.sdkman.io" | bash
else
  echo ">> SDKMAN is already installed"
  echo ">> SDKMAN_DIR = $SDKMAN_DIR"
fi

echo "source sdkman"
source "$SDKMAN_DIR"/bin/sdkman-init.sh

if [[ "$(command -v sdk)" ]]; then
  echo "Installing gradle groovy java11 java17 java21 kotlin maven scala"
  sdk install gradle
  sdk install groovy
  sdk install java 11.0.22-tem
  sdk install java 17.0.9-tem
  sdk install java 21.0.2-tem
  sdk install kotlin
  sdk install maven
  sdk install scala
else
  echo "Command sdk not found."

fi
