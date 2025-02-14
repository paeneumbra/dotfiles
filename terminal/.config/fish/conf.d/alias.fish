# Neovim
alias v='nvim'
alias vim='nvim'

# Lazy
alias lzg='lazygit'
alias lzd='lazydocker'

# Docker
alias dcu='docker compose up -d'
alias dcd='docker compose down'

# Gradle
alias gw='./gradlew'
alias gwa='./gradlew clean assemble'
alias gwb='./gradlew clean build'

# Other
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'"                                   # show only dotfiles
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
