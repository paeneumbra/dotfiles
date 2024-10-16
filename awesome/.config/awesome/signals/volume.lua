local awful = require "awful"
local gears = require "gears"

local cmd_volume = "wpctl get-volume @DEFAULT_AUDIO_SINK@"

local function get_vol()
    awful.spawn.easy_async_with_shell(cmd_volume, function(vol)
        if string.find(vol, "MUTED") then
            muted = true
        else
            muted = false
        end

        local volume_value = function()
            local match = string.match(vol, "[%d%.]+")
            local value = math.ceil(tonumber(match) * 100)
            return value
        end

        volume = volume_value()

        awesome.emit_signal("signal::volume", volume, muted)
    end)
end

gears.timer {
    timeout = 2,
    call_now = true,
    autostart = true,
    callback = function()
        get_vol()
    end,
}
