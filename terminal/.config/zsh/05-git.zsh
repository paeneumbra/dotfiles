# Git version checking
autoload -Uz is-at-least
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,master}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

# Rename local branch
function gbrename() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Use: $0 old_branch_name new_branch_name"
    return 1
  fi
  git branch -m "$1" "$2"
}

alias ga='git add'
alias gap='git add -p'
alias gaa='git add --all'
alias gc!='git commit --verbose --amend'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcm='git commit -m'
alias gcmsg='deprecated gcmsg gcm'
#alias gco='git checkout'
alias gco='git switch'
alias gema='git log --pretty="%an - %ae"'
alias glgg='git log --graph'
# alias glo='git log --oneline --decorate --graph'
alias glo="git log --graph --pretty='tformat:%C(auto)%h%d %s %C(black)%C(bold)%cL %C(green)%cr'"
alias gloa='git log --oneline --decorate --graph --all'
#alias gcm='git checkout $(git_main_branch)'
alias gm='git switch $(git_main_branch)'
alias gmb='git branch --merged | grep -Ev "(^\*|^\s*(master|main)$)"'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gst='git status'
alias gsu='git stash -u -m'

# Tryout
alias gpr='git pull --rebase -v'
alias glb='git branch -vv'
alias gub='git branch -vv --no-merged'

# Some more ideas: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

function deprecated(){
  print -Pu2 "%F{red}$1%F{yellow} is deprecated in favour of %F{green}$2%F{yellow}"
}
unset git_version
