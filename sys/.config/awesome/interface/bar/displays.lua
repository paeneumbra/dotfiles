local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local helper = require("helpers.displays")


-- Displays
local default_markup = "<span foreground='" .. Color.cyan .. "'> 󰍺 </span>"
local displays = wibox.widget({
    widget = wibox.widget.textbox,
    font = Default_Font,
    markup = default_markup,
})

displays:connect_signal("mouse::enter", function()
    displays.markup = "<span foreground='" .. Color.gray .. "'> 󰍺 </span>"
end)

displays:connect_signal("mouse::leave", function()
    displays.markup = default_markup
end)

displays:buttons(gears.table.join(awful.button({}, 1, function()
    helper.standard_dual_setup()
end)))

return displays
