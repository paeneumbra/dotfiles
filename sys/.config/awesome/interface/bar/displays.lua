local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

--TODO: Temporary - display utility will be used only by XF86Display keybinding
-- At most move it to sidebar as a button!

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
    awesome.emit_signal("displays::toggle")
end)))

return displays
