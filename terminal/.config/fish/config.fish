if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

set -g -x fish_greeting ''

# https://github.com/kidonng/plug.fish#installation
set plugins \
    https://github.com/kidonng/plug.fish \
    https://github.com/jorgebucaran/autopair.fish \
    https://github.com/jorgebucaran/replay.fish \
    https://github.com/jorgebucaran/nvm.fish
source (
    path filter $__fish_user_data_dir/plugins/plug.fish/conf.d/plugin_load.fish ||
    curl https://raw.githubusercontent.com/kidonng/plug.fish/v3/conf.d/plugin_load.fish | psub
)

# Enable starship config
set --universal --export STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

fish_add_path --prepend "$HOME/foundry/anvil/bin"

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Python, pip and pyenv
fish_add_path --prepend "$HOME/.local/bin"
if test -d "$HOME/.pyenv"
    set --universal --export PYENV_ROOT $HOME/.pyenv
    set --universal --export PIPX_DEFAULT_PYTHON $HOME/.pyenv/shims/python
    fish_add_path --prepend "$PYENV_ROOT/bin"
     pyenv init - | source
end

# SDKMAN
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
