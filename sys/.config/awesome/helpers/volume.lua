local awful = require("awful")

local notify = require("helpers.notifications")

local _volume = {}

local cmd_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
local cmd_volume_increase = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"
local cmd_volume_decrease = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"

function _volume.toggle_volume()
    awful.spawn.easy_async_with_shell(cmd_mute, function()
        notify.normal("Mute/Unmute!")
    end)
end

function _volume.increase()
    awful.spawn.easy_async_with_shell(cmd_volume_increase, function()
        notify.normal("Volume increased")
    end)
end

function _volume.decrease()
    awful.spawn.easy_async_with_shell(cmd_volume_decrease, function()
        notify.normal("Volume decreased")
    end)
end

return _volume