# Find command
function fcmd
    printf '%s\n' (history | fzf -q "$argv" \
        --header 'Options >>> Press ESC to keep modified command ' \
        --prompt 'Find Command> ' \
        --bind 'esc:print-query+abort')
end
