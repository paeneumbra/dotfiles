#!/usr/bin/env zsh

# Bluetooth
alias btc='bluetoothctl connect'
alias btd='bluetoothctl disconnect'

# Handlr - replacement for xdg-open
alias open='handlr open'

# Setup Keychron
alias k2='sudo systemctl start keychron'

# Optimus
# These commands are needed if gdm-prime and nvidia graphics are installed.
alias prime='optimus-manager --status'
alias intel='optimus-manager --switch integrated'
alias nvidia='optimus-manager --switch nvidia'
