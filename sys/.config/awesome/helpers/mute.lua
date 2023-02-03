local awful = require("awful")

local notify = require("helpers.notifications")

local _mute = {}

local cmd_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

function _mute.toggle_volume()
    awful.spawn.easy_async_with_shell(cmd_mute, function()
        notify.normal("Mute/Unmute!")
    end)
end

return _mute