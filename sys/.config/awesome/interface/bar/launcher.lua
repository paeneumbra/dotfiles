local awful = require("awful")
local gears = require("gears")

local widgets = require("interface.helpers.widgets")

-- Launcher
local default_markup = widgets.colored_markup("󱥨", Color.cyan)
local launcher = widgets.basic_icon(default_markup)

launcher:connect_signal("mouse::enter", function()
    launcher.markup = widgets.colored_markup("󱥨", Color.gray)
end)

launcher:connect_signal("mouse::leave", function()
    launcher.markup = default_markup
end)

launcher:buttons(gears.table.join(awful.button({}, 1, function()
    awful.spawn(Apps.launcher, false)
end)))

return launcher
