#!/usr/bin/env zsh

# Check if main exists and use instead of master
git_main_branch() {
  if ! git rev-parse --git-dir &>/dev/null; then
    return
  fi
  local ref
  for ref in refs/heads/{main,master,trunk,mainline,default} refs/remotes/{origin,upstream}/{main,master,trunk,mainline,default}; do
    if git show-ref -q --verify "$ref"; then
      echo "${ref##*/}"  # Get the branch name
      return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

# Rename local branch
git_branch_rename() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Use: $0 old_branch_name new_branch_name"
    return 1
  fi
  git branch -m "$1" "$2"
}

# Aliases
alias ga='git add'
alias gap='git add -p'
alias gaa='git add --all'
alias gc!='git commit --verbose --amend'
alias gcb='git checkout -b'
alias gcfl='git config --list'
alias gcm='git commit -m'
alias gco='git switch'
alias gema='git log --pretty="%an - %ae"'
alias glgg='git log --graph'
alias glo="git log --graph --pretty='tformat:%C(auto)%h%d %s %C(black)%C(bold)%cL %C(green)%cr'"
alias gloa='git log --oneline --decorate --graph --all'
alias gm='git switch $(git_main_branch)'
alias gmb='git branch --merged | grep -Ev "(^\*|^\s*(master|main)$)"'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gst='git status'
alias gsu='git stash -u -m'
alias gpr='git pull --rebase -v'
alias glb='git branch -vv'
alias gub='git branch -vv --no-merged'
