local awful = require("awful")
local gears = require("gears")

local helper = require("helpers.displays")
local widgets = require("interface.helpers.widgets")


-- Displays
local default_markup = widgets.colored_markup("󰍺", Color.cyan)
local displays = widgets.basic_icon(default_markup)

displays:connect_signal("mouse::enter", function()
    displays.markup = widgets.colored_markup("󰍺", Color.gray)
end)

displays:connect_signal("mouse::leave", function()
    displays.markup = default_markup
end)

displays:buttons(gears.table.join(awful.button({}, 1, function()
    helper.update_displays()
end)))

return displays
