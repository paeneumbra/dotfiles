local awful = require("awful")
local gears = require("gears")

local widgets = require("helpers.widgets")

-- Launcher
local launcher = widgets.wibar_icon("󰍜", Color.green)

launcher:connect_signal("mouse::enter", function()
    launcher.markup = widgets.colored_markup("󰍜", Color.fg)
end)

launcher:connect_signal("mouse::leave", function()
    launcher.markup = widgets.colored_markup("󰍜", Color.green)
end)

launcher:buttons(gears.table.join(awful.button({}, 1, function()
    awful.spawn(Apps.launcher, false)
end)))

return launcher
