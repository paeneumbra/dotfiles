local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local width = awful.screen.focused().workarea.width
local height = awful.screen.focused().workarea.height
local workarea_x = awful.screen.focused().workarea.x
local workarea_y = awful.screen.focused().workarea.y
local gap_buffer = beautiful.useless_gap * 2

-- Clock
local clock = wibox.widget.background()
clock:set_widget(wibox.widget.textclock("%A %d/%m/%Y | %R"))
clock:set_fg(Color.yellow)

-- Calendar
local calendar = wibox.widget.background()
calendar:set_widget(wibox.widget.calendar.month(os.date("*t")))
calendar:set_fg(Color.magenta)

local dashboard = awful.popup({
	widget = {
		{
			{
				{
					-- forced_height = dpi(70),
					-- forced_width = dpi(100),
					widget = wibox.container.background(wibox.container.place(clock)),
				},
				bg = Color.bg,
				-- clip = true,
				widget = wibox.container.background,
			},
			{
				{
					widget = wibox.container.background(wibox.container.place(calendar)),
				},
				bg = Color.bg,
				-- clip = true,
				widget = wibox.container.background,
			},
			spacing = dpi(8),
			layout = wibox.layout.fixed.vertical,
		},
		spacing = dpi(8),
		layout = wibox.layout.fixed.horizontal,
	},
	border_width = dpi(2),
	border_color = Color.blue,
	placement = awful.placement.centered,
	ontop = true,
	visible = false,
})

-- Signal
awesome.connect_signal("sidebar::toggle", function()
	dashboard.visible = not dashboard.visible
end)

return dashboard
