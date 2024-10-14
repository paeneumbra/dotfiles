#!/usr/bin/env zsh

# Disable compinit call
# to disable compinit error from zsh, modify sdkman/etc/config sdkman_auto_complete=false

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
