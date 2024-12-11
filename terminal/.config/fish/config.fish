if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin

# set HELPERS_DIRECTORY "$XDG_CONFIG_HOME/shell/"
# for file in $HELPERS_DIRECTORY/*.sh
#     if test -f $file
#         source $file
#         echo "sorcing stuffs"
#     end
# end

# End of file required
starship init fish | source

zoxide init fish | source
