local awful = require("awful")
local gears = require("gears")

local helper = require("helpers.displays")
local widgets = require("helpers.widgets")

-- Displays
local displays = widgets.wibar_icon("󱡶", Color.green)

displays:connect_signal("mouse::enter", function()
    displays.markup = widgets.colored_markup("󱡶", Color.fg)
end)

displays:connect_signal("mouse::leave", function()
    displays.markup = widgets.colored_markup("󱡶", Color.green)
end)

displays:buttons(gears.table.join(awful.button({}, 1, function()
    helper.update_displays()
end)))

return displays
