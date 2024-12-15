if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test "$os" = "darwin"
    fish_add_path /opt/homebrew/bin
end

set --universal --export PYENV_ROOT $HOME/.pyenv
fish_add_path --path $PYENV_ROOT/bin

# End of file required
starship init fish | source

zoxide init fish | source
