#!/bin/bash

#  __      __         ___
# /\ \  __/\ \  __  /'___\ __
# \ \ \/\ \ \ \/\_\/\ \__//\_\
#  \ \ \ \ \ \ \/\ \ \ ,__\/\ \
#   \ \ \_/ \_\ \ \ \ \ \_/\ \ \
#    \ `\___x___/\ \_\ \_\  \ \_\
#     '\/__//__/  \/_/\/_/   \/_/
#

# Find wireless connection state

# Enable strict mode:
# -e: Exit immediately if a command exits with a non-zero status
# -u: Treat unset variables as an error
# -o pipefail: Ensure that any failure in a pipeline causes the script to fail
set -euo pipefail

## Print utility:
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

function print_info() {
  echo -e "${GREEN}$1${RESET}"
}

# Active connectors
ID=$(ip link | awk '/state UP/ {print $2}' | tr -d :)
# Wifi connection status
STATUS=$(nmcli g | tail -1 | awk '{print $1}')
# Connection name
SSID=$(nmcli -t -f active,ssid dev wifi show | sed -n '1{s/SSID: //p}')

is_online() {
  ping -c 3 -W 1 archlinux.org
}

# Function to get Wi-Fi status and strength
get_wifi() {
  # Execute the command to get the Wi-Fi status
  state="$STATUS"

  # Check if the status indicates disconnection or being asleep
  if [[ "$state" == "disconnected" || "$state" == "asleep" ]]; then
    # Emit signal indicating Wi-Fi is not connected
    print_info "Wifi disconnected"
  else
    # Execute the command to get the Wi-Fi strength
    strength=$(eval "awk 'NR==3 { print int(\$3 * 100 / 70) }' /proc/net/wireless")

    # Validate the strength value; default to 0 if not available
    if [[ -z "$strength" ]]; then
      strength=0
    else
      strength=$(printf "%d" "$strength") # Convert to integer
    fi

    # Emit signal indicating Wi-Fi is connected with its strength
    print_info "Wifi is connected to <$SSID> with strength <$strength>"
  fi
}

print_info "Active connectors: $ID"
get_wifi
print_info "Ping archlinux:"
is_online
