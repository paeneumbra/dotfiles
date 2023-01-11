local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local day = wibox.widget({
	align = "center",
})

local date = wibox.widget({
	align = "center",
})

gears.timer({
	timeout = 60,
	call_now = true,
	autostart = true,
	callback = function()
		day.markup = "<span foreground='" .. Color.red .. "'>" .. os.date("%A") .. "</span>"
		date.markup = os.date("%d %B %Y")
	end,
})

return wibox.widget {
	day,
	date,
	spacing = dpi(4),
	layout = wibox.layout.fixed.vertical,
}
