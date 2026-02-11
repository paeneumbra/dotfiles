#!/usr/bin/env bash
set -euo pipefail


# Fix for pyenv rehash lock file issue caused by FZF interruptions
#
# SYMPTOM:
# Console locks up on startup - terminal opens but no prompt appears (no caret/cursor).
# Ctrl+C works to interrupt, but shell configuration doesn't load properly.
# This includes prompt customizations like Starship, aliases, functions, etc.
# Opening new terminals doesn't help - all terminals hang the same way.
#
# ROOT CAUSE:
# FZF (fuzzy finder) has known issues where it hangs nondeterministically, especially
# during history search (Ctrl-R), nested instances, or in certain terminal configs.
# See: https://github.com/junegunn/fzf/issues/2009
#
# When FZF locks up and is interrupted (Ctrl+C), it can catch pyenv mid-rehash,
# leaving behind a stale lock file at ~/.pyenv/shims/.pyenv-shim. This is similar
# to the race condition when multiple terminals start simultaneously.
# See: https://github.com/pyenv/pyenv/issues/2829
#
# On subsequent terminal sessions, pyenv initialization tries to rehash but gets
# stuck waiting 60 seconds for the orphaned lock. During this hang, shell config
# execution stops, preventing Starship and other tools from loading.
#
# SOLUTION:
# Remove the stale lock file left behind by the interrupted FZF/pyenv interaction
# and force a clean rehash.
# Use PYENV_ROOT if set; otherwise pyenv's common default.
PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"  # default is $HOME/.pyenv [web:17]

lock_file="$PYENV_ROOT/shims/.pyenv-shim"

if ! command -v pyenv >/dev/null 2>&1; then
  echo "pyenv not found on PATH; aborting." >&2
  exit 127
fi

if [[ -e "$lock_file" ]]; then
  rm -f "$lock_file"
  echo "✅ Stale lock file removed successfully."
  pyenv rehash
else
  echo "ℹ️  No lock file found."
fi

