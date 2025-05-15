#!/bin/bash

if [[ $(uname) == "Linux" ]]; then
  alias t='go-task'
  alias btc='bluetoothctl connect'
  alias btd='bluetoothctl disconnect'
  alias k2='sudo systemctl start keychron'
fi
