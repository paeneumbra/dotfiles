# Environment
alias reloadzsh='source $ZDOTDIR/.zshrc'
alias dots='cd $DOTFILES'

# Directories
alias la='ls -lAh'
alias ll='ls -lh'

# Vim
alias v='nvim'
alias vim='nvim'

# Copy and move
alias cp='cp -iv'
alias mv='mv -iv'

# Print each PATH entry on a separate line
alias path="echo -e \"${PATH//:/\\n}\""

# Stow
alias restow='stow --verbose --dir=$HOME/workspace --target=$HOME sys'
