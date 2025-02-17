#!/bin/bash

vol() {
  if [ $# -eq 1 ]; then
    volume_percent=$1%
    case $(uname) in
    Linux)
      wpctl set-volume @DEFAULT_AUDIO_SINK@ "$volume_percent"
      ;;
    Darwin)
      osascript -e "set volume output volume $1"
      ;;
    *)
      echo "Unsupported operating system"
      ;;
    esac
  else
    echo "Usage: vol <percentage>"
  fi
}
