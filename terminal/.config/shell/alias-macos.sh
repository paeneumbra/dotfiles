#!/bin/bash

if [[ $(uname) == "Darwin" ]]; then
  alias t='task'
  alias rssh="eval '$(ssh-agent -s)'"
fi
