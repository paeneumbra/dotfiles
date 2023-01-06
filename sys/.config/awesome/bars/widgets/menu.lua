local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Menu
local menu = wibox.widget.textbox()
menu.font = "Roboto 16"
menu.markup = ""

menu:connect_signal("mouse::enter", function()
	menu.markup = "<span foreground='" .. color.blue .. "'></span>"
end)

menu:connect_signal("mouse::leave", function()
	menu.markup = ""
end)

menu:buttons(gears.table.join(awful.button({}, 1, function()
	awesome.emit_signal("sidebar::toggle")
end)))

return menu
