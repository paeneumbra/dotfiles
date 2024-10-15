#!/usr/bin/env zsh

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
export HOMEBREW_NO_ANALYTICS=1

# Python is not recognized after macos is updated
# Can cause apps to break
alias python="python3"
