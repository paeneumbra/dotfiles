local awful = require("awful")
local gears = require("gears")

local helper = require("helpers.displays")
local widgets = require("helpers.wibarwidgets")

-- Displays
local displays = widgets.wibar_icon("󱡶", Color.green)

displays:connect_signal("mouse::enter", function()
    displays.markup = widgets.recolor("󱡶", Color.fg)
end)

displays:connect_signal("mouse::leave", function()
    displays.markup = widgets.recolor("󱡶", Color.green)
end)

displays:buttons(gears.table.join(awful.button({}, 1, function()
    helper.update_displays()
end)))

return displays
