# Shell wrapper, changes the current directory upon leaving yazi
# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y --description 'Navigate and change directory with yazi'
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
