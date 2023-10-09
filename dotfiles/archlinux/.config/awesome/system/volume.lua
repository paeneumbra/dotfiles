local awful = require("awful")

local notify = require("helpers.notifications")

local volume = {}

local cmd_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
local cmd_volume_increase = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"
local cmd_volume_decrease = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"

function volume.toggle_volume()
    awful.spawn.easy_async_with_shell(cmd_mute, function()
        notify.normal("Volume: Mute/Unmute!")
    end)
end

function volume.increase()
    awful.spawn.easy_async_with_shell(cmd_volume_increase, function()
        notify.normal("Volume: Increased")
    end)
end

function volume.decrease()
    awful.spawn.easy_async_with_shell(cmd_volume_decrease, function()
        notify.normal("Volume: Decreased")
    end)
end

function volume.set(value)
    awful.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. value .. "%", false)
end

return volume
