local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Menu
local menu = wibox.widget({
	widget = wibox.widget.textbox,
	font = "Iosevka Nerd Font 14",
	markup = "<span foreground='" .. color.blue .. "'>  </span>",
})

menu:connect_signal("mouse::enter", function()
	menu.markup = "<span foreground='" .. color.yellow .. "'>  </span>"
end)

menu:connect_signal("mouse::leave", function()
	menu.markup = "<span foreground='" .. color.blue .. "'>  </span>"
end)

-- TODO: sidebar is a function to be created
menu:buttons(gears.table.join(awful.button({}, 1, function()
	awesome.emit_signal("sidebar::toggle")
end)))

return menu
