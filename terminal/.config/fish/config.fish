if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

set -g -x fish_greeting ''

# Enable starship config
set --universal --export STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

fish_add_path --prepend "$HOME/foundry/anvil/bin"
fish_add_path --prepend "$HOME/foundry/anvil/terminal/.config/decorator/scripts"

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Python, pip and pyenv
fish_add_path --prepend "$HOME/.local/bin"
if test -d "$HOME/.pyenv"
    set --universal --export PYENV_ROOT $HOME/.pyenv
    fish_add_path --prepend "$PYENV_ROOT/bin"
     pyenv init - | source
end

if test -d "$HOME/.sdkman"
    set --universal --export SDKMAN_DIR "$HOME/.sdkman"
    if set -q SDKMAN_DIR; and not test -f "$SDKMAN_DIR/bin/sdkman-init.sh"
        echo "WARNING: SDKMAN! installation path set to $SDKMAN_DIR, but no installation found there"
        exit 0
    end
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/gradle/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/java/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/kotlin/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/maven/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/groovy/current/bin" -maxdepth 0)
    fish_add_path --prepend (find "$HOME/.sdkman/candidates/scala/current/bin" -maxdepth 0)
end

# End of file required
starship init fish | source

zoxide init fish | source
