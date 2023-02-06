local awful = require("awful")

local notify = require("helpers.notifications")

local _volume = {}

local cmd_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
local cmd_volume_increase = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"
local cmd_volume_decrease = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"

function _volume.toggle_volume()
    awful.spawn.easy_async_with_shell(cmd_mute, function()
        notify.normal("Volume: Mute/Unmute!")
    end)
end

function _volume.increase()
    awful.spawn.easy_async_with_shell(cmd_volume_increase, function()
        notify.normal("Volume: Increased")
    end)
end

function _volume.decrease()
    awful.spawn.easy_async_with_shell(cmd_volume_decrease, function()
        notify.normal("Volume: Decreased")
    end)
end

function _volume.pick(vol, muted)
    if muted then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰖁</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>" .. vol .. "%</span>",
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰕾</span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. vol .. "%</span>",
        }
    end
end

function _volume.button_area(muted)
    if muted then
        return {
            icon = "<span foreground='" .. Color.bg .. "'>󰖁</span>",
            background = Color.accent,
        }
    else
        return {
            icon = "<span foreground='" .. Color.accent .. "'>󰕾</span>",
            background = Color.bg,
        }
    end
end

return _volume