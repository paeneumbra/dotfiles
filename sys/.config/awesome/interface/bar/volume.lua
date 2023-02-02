local awful = require("awful")
local naughty = require("naughty")

local widgets = require("interface.helpers.widgets")

local cmd_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

-- Volume
local default_markup = widgets.colored_markup("󰕾", Color.green)
local volume = widgets.basic_icon(default_markup)

awesome.connect_signal("signal::volume", function(vol, mute)
    vol = tonumber(vol)
    if mute or vol == 0 then
        volume.markup = widgets.colored_markup("󰖁", Color.red)
    else
        volume.markup = default_markup
    end
end)

volume:connect_signal("button::press", function()
    awful.spawn.easy_async_with_shell(cmd_mute, function()
        naughty.notification({
            urgency = "normal",
            title = "󰋼 Info:",
            message = "Mute/Unmute!",
        })
    end)
end)

volume:connect_signal("mouse::enter", function()
    volume.markup = widgets.colored_markup("󰕾", Color.gray)
end)

-- TODO: Consider opening pavucontrol with left click

return volume
