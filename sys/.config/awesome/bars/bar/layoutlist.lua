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
			left = dpi(2),
			right = dpi(2),
			-- forced_width = dpi(30),
			widget = wibox.container.margin,
		},
		bg = color.bg,
		style = {
			spacing = dpi(5),
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
