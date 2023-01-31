local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Menu
local default_markup = "<span foreground='" .. Color.cyan .. "'> 󰛾 </span>"
local sidebar = wibox.widget({
    widget = wibox.widget.textbox,
    font = Font,
    markup = default_markup,
})

sidebar:connect_signal("mouse::enter", function()
    sidebar.markup = "<span foreground='" .. Color.yellow .. "'> 󰛾 </span>"
end)

sidebar:connect_signal("mouse::leave", function()
    sidebar.markup = default_markup
end)

--TODO: Temporary - display utility will be used only by XF86Display keybinding
sidebar:buttons(gears.table.join(awful.button({}, 1, function()
    awesome.emit_signal("displays::toggle")
end)))

return sidebar
