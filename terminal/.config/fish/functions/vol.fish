function vol --description 'Set volume to given percentage'
    if test (count $argv) -eq 1
        set volume_percent $argv[1]%
        switch (uname)
            case Linux
                wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume_percent
            case Darwin
                osascript -e "set volume output volume $argv[1]"
            case '*'
                echo "Unsupported operating system"
        end
    else
        echo "Usage: vol <percentage>"
    end
end
