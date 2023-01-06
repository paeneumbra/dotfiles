local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local launcher = wibox.widget.textbox()
launcher.font = "Iosevka Nerd Font 16"
launcher.markup = ""

launcher:connect_signal("mouse::enter", function()
	launcher.markup = "<span foreground='" .. color.bg .. "'></span>"
end)

launcher:connect_signal("mouse::leave", function()
	launcher.markup = ""
end)

launcher:buttons(gears.table.join(awful.button({}, 1, function()
	awful.spawn(apps.launcher, false)
end)))

return launcher
