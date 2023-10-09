# Git version checking
autoload -Uz is-at-least
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

# Git
alias ga='git add'
alias gst='git status'
alias gcm='git checkout $(git_main_branch)'
alias gcmsg='git commit -m'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gaa='git add --all'
alias glo='git log --oneline --decorate'
alias gema='git log --pretty="%an - %ae"'
alias glgg='git log --graph'

# Commands still trying to memorize
# More: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
alias gc!='git commit --verbose --amend'
alias gcf='git config --list'
alias gd='git diff'

# Deprecated
alias gsab='git submodule add -b'

unset git_version
