# function fcmd --description 'Find command using fzf'
#     set -f commands_selected (history | fzf_wrapper -q "$argv" \
#         --prompt 'ESC (keep promtp) | Find Command> ' \
#         --bind 'esc:print-query+abort')
#
#         commandline --replace -- $commands_selected
# end

# Source: https://github.com/PatrickF1/fzf.fish/blob/main/functions/_fzf_search_history.fish
function fcmd --description "Fing command history and print to command line"
    # history merge incorporates history changes from other fish sessions
    # it errors out if called in private mode
    if test -z "$fish_private_mode"
        builtin history merge
    end

    if not set --query fzf_history_time_format
        set -f fzf_history_time_format "%F %T"
    end

    # Delinate time from command in history entries using the vertical box drawing char (U+2502).
    # Then, to get raw command from history entries, delete everything up to it. The ? on regex is
    # necessary to make regex non-greedy so it won't match into commands containing the char.
    set -f time_prefix_regex '^.*? │ '
    # Delinate commands throughout pipeline using null rather than newlines because commands can be multi-line
    set -f commands_selected (
        builtin history --null --show-time="$fzf_history_time_format │ " |
        fzf_wrapper --read0 \
            --print0 \
            --multi \
            --scheme=history \
            --prompt="History> " \
            --query=(commandline) \
            --preview="string replace --regex '$time_prefix_regex' '' -- {} | fish_indent --ansi" \
            --preview-window="bottom:3:wrap" \
            $fzf_history_opts |
        string split0 |
        # remove timestamps from commands selected
        string replace --regex $time_prefix_regex ''
    )

    if test $status -eq 0
        commandline --replace -- $commands_selected
    end

    commandline --function repaint
end
