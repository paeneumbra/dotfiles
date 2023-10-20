local awful = require "awful"
local gears = require "gears"

local widgets = require "helpers.wibarwidgets"

-- Launcher
local launcher = widgets.wibar_icon("", Color.green)

launcher:connect_signal("mouse::enter", function()
    launcher.markup = widgets.recolor("", Color.fg)
end)

launcher:connect_signal("mouse::leave", function()
    launcher.markup = widgets.recolor("", Color.green)
end)

launcher:buttons(gears.table.join(awful.button({}, 1, function()
    awful.spawn(Apps.launcher, false)
end)))

return launcher
