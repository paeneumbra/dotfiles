#!/bin/bash

# Check if main exists and use instead of master
git_main_branch() {
  if ! git rev-parse --git-dir &>/dev/null; then
    return
  fi
  local ref
  for ref in refs/heads/{main,master,trunk,mainline,default} refs/remotes/{origin,upstream}/{main,master,trunk,mainline,default}; do
    if git show-ref -q --verify "$ref"; then
      echo "${ref##*/}" # Get the branch name
      return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

# Rename local branch
git_branch_rename() {
  if [[ -z $1 || -z $2 ]]; then
    echo "Use: $0 old_branch_name new_branch_name"
    return 1
  fi
  git branch -m "$1" "$2"
}
