# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1

export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
export PATH="/opt/homebrew/opt/python/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.12/bin:$PATH"
# for rollback `brew link --overwrite python@<version>` and export again.
