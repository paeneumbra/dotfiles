# Find command
function fcmd
    set -f commands_selected (history | fzf -q "$argv" \
        --header 'Options >>> Press ESC to keep modified command ' \
        --prompt 'Find Command> ' \
        --bind 'esc:print-query+abort')

        commandline --replace -- $commands_selected
end
