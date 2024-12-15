if test -d "$HOME/.sdkman"
    set --universal --export SDKMAN_DIR "$HOME/.sdkman"
    if set -q SDKMAN_DIR; and not test -f "$SDKMAN_DIR/bin/sdkman-init.sh"
        echo "WARNING: SDKMAN! installation path set to $SDKMAN_DIR, but no installation found there"
        exit 0
    else
        function sdk
            bash -c "source '$HOME/.sdkman/bin/sdkman-init.sh'; sdk $argv[1..]"
        end
    end
end
