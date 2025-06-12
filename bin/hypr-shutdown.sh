#!/bin/bash

# Check if gum is installed
if ! command -v gum &>/dev/null; then
  echo "gum is not installed. Install it with 'sudo pacman -S gum'"
  exit 1
fi

# Create a menu with gum
CHOICE=$(gum choose "Logoff" "Shutdown" "Reboot" "Cancel")

case "$CHOICE" in
"Logoff")
  hyprctl dispatch exit
  ;;
"Shutdown")
  shutdown now
  ;;
"Reboot")
  systemctl reboot
  ;;
"Cancel")
  echo "Action cancelled."
  ;;
*)
  echo "Invalid option."
  ;;
esac
