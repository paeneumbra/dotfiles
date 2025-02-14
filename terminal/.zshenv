# Set default editors
export EDITOR='nvim'
export VISUAL='nvim'

# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Zsh directory
ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
