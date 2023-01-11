local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local launcher = wibox.widget({
	markup = "  ",
	widget = wibox.widget.textbox,
	font = Font,
})

launcher:connect_signal("mouse::enter", function()
	launcher.markup = "<span foreground='" .. Color.yellow .. "'>  </span>"
end)

launcher:connect_signal("mouse::leave", function()
	launcher.markup = "  "
end)

launcher:buttons(gears.table.join(awful.button({}, 1, function()
	awful.spawn(Apps.launcher, false)
end)))

return launcher
