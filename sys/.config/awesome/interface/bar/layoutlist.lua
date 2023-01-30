local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
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
			left = xdpi(2),
			right = xdpi(2),
			-- forced_width = xdpi(30),
			widget = wibox.container.margin,
		},
		bg = Color.bg,
		style = {
			spacing = xdpi(5),
		},
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, 5)
		end,
		widget = wibox.container.background,
		screen = s,
	})

	layoutlist:connect_signal("button::press", function()
		awful.layout.inc(1, s)
	end)

	return layoutlist
end
