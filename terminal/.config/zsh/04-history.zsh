#!/usr/bin/env zsh

# History
HIST_STAMPS="dd.mm.yyyy"
HISTFILE=$HOME/.cache/zsh/histfile
HISTSIZE=20000000
SAVEHIST=20000000
HISTORY_IGNORE="(clear|exit|ls|la|gst|cd)"

# The meaning of these options can be found in man page of `zshoptions`.
# do not put duplicated command into history list
setopt HIST_IGNORE_ALL_DUPS
# do not save duplicated command
setopt HIST_SAVE_NO_DUPS
# remove unnecessary blanks
setopt HIST_REDUCE_BLANKS
# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE
