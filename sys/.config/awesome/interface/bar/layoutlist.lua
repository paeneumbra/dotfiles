local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

return function(s)
	local layoutlist = wibox.widget({
		{
			{
				awful.widget.layoutbox(s),
				id = "icon_layout",
				widget = wibox.container.place,
			},
			id = "icon_margin",
			left = Xdpi(2),
			right = Xdpi(2),
			-- forced_width = xdpi(30),
			widget = wibox.container.margin,
		},
		bg = Color.bg,
		style = {
			spacing = Xdpi(5),
		},
		widget = wibox.container.background,
		screen = s,
	})

	layoutlist:connect_signal("button::press", function()
		awful.layout.inc(1, s)
	end)

	return layoutlist
end
