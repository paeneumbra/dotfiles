#!/bin/bash

# shellcheck disable=SC2139
alias zpath="echo -e '${PATH//:/\\n}'"

# Path
export PATH="$HOME/foundry/anvil/bin:$PATH"
export PATH="$HOME/foundry/anvil/terminal/.config/decorator/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
