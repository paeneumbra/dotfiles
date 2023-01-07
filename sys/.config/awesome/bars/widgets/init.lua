local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

-- Widgets
local battery = require("bars.widgets.battery")
local clock = require("bars.widgets.clock")
local launcher = require("bars.widgets.launcher")
local layoutbox = require("bars.widgets.layoutbox")
local menu = require("bars.widgets.menu")
local tags = require("bars.widgets.tags")
local task = require("bars.widgets.tasks")
local volume = require("bars.widgets.volume")
local wifi = require("bars.widgets.wifi")
--

-- Systray
local systray = wibox.widget({
	{
		{
			{
				launcher,
				menu,
				wifi,
				volume,
				battery,
				spacing = dpi(6),
				wibox.widget.systray,
				layout = wibox.layout.fixed.horizontal,
			},
			margins = { top = dpi(2), bottom = dpi(2), left = dpi(6), right = dpi(6) },
			widget = wibox.container.margin,
		},
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, 8)
		end,
		bg = color.bg,
		widget = wibox.container.background,
	},
	margins = { top = dpi(6), bottom = dpi(6) },
	widget = wibox.container.margin,
})

-- Right
local right = wibox.widget({
	{
		systray,
		clock,
		layoutbox(s),
		spacing = dpi(20),
		layout = wibox.layout.fixed.horizontal,
	},
	margins = { top = dpi(4), bottom = dpi(4), right = dpi(10) },
	widget = wibox.container.margin,
})

-- Left
local function left(s)
	return wibox.widget({
		{
			tags(s),
			spacing = dpi(20),
			layout = wibox.layout.fixed.horizontal,
		},
		margins = { top = dpi(4), bottom = dpi(4), left = dpi(10) },
		widget = wibox.container.margin,
	})
end

-- Bar
local function get_bar(s)
	local bar = wibox({
		visible = true,
		ontop = false,
		width = s.geometry.width,
		height = dpi(50),
		y = s.geometry.height - dpi(50),
		bg = color.bg,
		type = "dock",
	})

	bar:struts({ bottom = dpi(50), top = dpi(20), left = dpi(20), right = dpi(20) })

	bar:setup({
		left(s),
		{
			nil,
			task(s),
			expand = "none",
			layout = wibox.layout.align.horizontal,
		},
		right,
		layout = wibox.layout.align.horizontal,
	})
end

awful.screen.connect_for_each_screen(function(s)
	get_bar(s)
end)
