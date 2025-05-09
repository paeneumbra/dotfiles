#!/usr/bin/env zsh
# Path
export PATH="$HOME/foundry/anvil/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Zsh specific
# zimfw recommendation to avoid compinit conflicts
alias rzsh='exec zsh'

# These tools require the exports to be present in the end of the file
# and might cause problems with completion and compinit

# nvm
export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# To disable compinit error from zsh, modify sdkman/etc/config sdkman_auto_complete=false
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/shims/python"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - path)"
