local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

-- Widgets
local battery = require("bars.bar.battery")
local clock = require("bars.bar.clock")
local launcher = require("bars.bar.launcher")
local layoutlist = require("bars.bar.layoutlist")
local menu = require("bars.bar.menu")
local tags = require("bars.bar.tags")
local task = require("bars.bar.tasks")
local volume = require("bars.bar.volume")
local wifi = require("bars.bar.wifi")
--

-- Systray
local systray = wibox.widget({
	{
		{
			{
				menu,
				wifi,
				volume,
				battery,
				spacing = dpi(2),
				wibox.widget.systray,
				layout = wibox.layout.fixed.horizontal,
			},
			margins = { top = dpi(1), bottom = dpi(1), left = dpi(2), right = dpi(2) },
			widget = wibox.container.margin,
		},
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, 8)
		end,
		bg = color.bg,
		widget = wibox.container.background,
	},
	margins = { top = dpi(2), bottom = dpi(2) },
	widget = wibox.container.margin,
})

-- Right
local function right(s)
	return wibox.widget({
		{
			systray,
			clock,
			layoutlist(s),
			-- spacing = dpi(5),
			layout = wibox.layout.fixed.horizontal,
		},
		margins = { top = dpi(2), bottom = dpi(2), right = dpi(6) },
		widget = wibox.container.margin,
	})
end

-- Left
local function left(s)
	return wibox.widget({
		{
			launcher,
			tags(s),
			spacing = dpi(10),
			layout = wibox.layout.fixed.horizontal,
		},
		margins = { top = dpi(2), bottom = dpi(2), left = dpi(6) },
		widget = wibox.container.margin,
	})
end

-- Bar
local function get_bar(s)
	local bar = wibox({
		visible = true,
		ontop = false,
		width = s.geometry.width,
		height = dpi(20),
		y = s.geometry.height - dpi(20),
		bg = color.bg,
		type = "dock",
	})

	bar:struts({ bottom = dpi(20), top = dpi(10), left = dpi(10), right = dpi(10) })

	bar:setup({
		left(s),
		{
			nil,
			task(s),
			expand = "none",
			layout = wibox.layout.align.horizontal,
		},
		right(s),
		layout = wibox.layout.align.horizontal,
	})
end

awful.screen.connect_for_each_screen(function(s)
	get_bar(s)
end)
