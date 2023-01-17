local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Menu
local menu = wibox.widget({
	widget = wibox.widget.textbox,
	font = Font,
	markup = "<span foreground='" .. Color.blue .. "'>  </span>",
})

menu:connect_signal("mouse::enter", function()
	menu.markup = "<span foreground='" .. Color.yellow .. "'>  </span>"
end)

menu:connect_signal("mouse::leave", function()
	menu.markup = "<span foreground='" .. Color.blue .. "'>  </span>"
end)

menu:buttons(gears.table.join(awful.button({}, 1, function()
	awesome.emit_signal("displays::toggle")
end)))

return menu
