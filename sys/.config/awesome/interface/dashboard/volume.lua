local awful = require("awful")

local widgets = require("helpers.dashboardwidgets")

local cmd_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

-- Volume
local volume = widgets.dashboard_button("󰕾")

volume:connect_signal("button::press", function()
    awful.spawn(cmd_mute, false)
end)

volume:connect_signal("mouse::enter", function()
    volume.markup = widgets.recolor("󰕾", Color.fg)
end)

volume:connect_signal("mouse::leave", function()
    volume.markup = widgets.recolor("󰕾", Color.accent)
end)

return volume
