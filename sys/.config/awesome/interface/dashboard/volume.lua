local awful = require("awful")

local widgets = require("helpers.widgets")

local cmd_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

-- Volume
local volume = widgets.basic_button("󰕾")

volume:connect_signal("button::press", function()
    awful.spawn.spawn(cmd_mute, false)
end)

volume:connect_signal("mouse::enter", function()
    volume.markup = widgets.colored_markup("󰕾", Color.fg)
end)

return volume
