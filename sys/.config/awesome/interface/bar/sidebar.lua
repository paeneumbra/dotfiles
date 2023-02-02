local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Sidebar
local default_markup = "<span foreground='" .. Color.cyan .. "'> 󰛾 </span>"
local sidebar = wibox.widget({
    widget = wibox.widget.textbox,
    font = Default_Font,
    markup = default_markup,
})

sidebar:connect_signal("mouse::enter", function()
    sidebar.markup = "<span foreground='" .. Color.gray .. "'> 󰛾 </span>"
end)

sidebar:connect_signal("mouse::leave", function()
    sidebar.markup = default_markup
end)

sidebar:buttons(gears.table.join(awful.button({}, 1, function()
    awesome.emit_signal("sidebar::toggle")
end)))

return sidebar
