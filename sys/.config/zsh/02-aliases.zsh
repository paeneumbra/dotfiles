# Environment
alias reloadzsh='source $ZDOTDIR/.zshrc'

# Directories
alias la='ls -lAh'
alias ll='ls -lh'

# Vim
alias v='nvim'
alias vim='nvim'

# Copy and move
alias cp='cp -iv'
alias mv='mv -iv'

# Print each PATH entry on a separate line
alias path="echo -e \"${PATH//:/\\n}\""

# Bluetooth
alias btc='bluetoothctl connect'
alias btd='bluetoothctl disconnect'

#Java
alias j11="sudo archlinux-java set java-11-openjdk"
alias j17="sudo archlinux-java set java-17-openjdk"
alias j21="sudo archlinux-java set java-21-openjdk"

# Handlr - replacement for xdg-open
alias open='handlr open'

# Setup Keychron
alias k2='sudo systemctl start keychron'
