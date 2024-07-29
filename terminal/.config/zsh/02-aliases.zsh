#!/usr/bin/env zsh

# Environment
alias rzsh='source $ZDOTDIR/.zshrc'

# Directories
alias la='ls -lAh'
alias ll='ls -lh'

# Vim
alias v='nvim'
alias vim='nvim'

# Copy and move
alias cp='cp -iv'
alias mv='mv -iv'

# Lazy
alias lzg='lazygit'
alias lzd='lazydocker'

# Gradle
alias gw='./gradlew'
alias gwa='./gradlew clean assemble'
alias gwb='./gradlew clean build'
alias gwsa='./gradlew :spotlessApply'

# Print each PATH entry on a separate line
alias path='echo -e "${PATH//:/\\n}"'

# Reload ssh agent
alias rssh='eval "$(ssh-agent -s)"'
