local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local somewidget = require("bars.widgets.clock")

local width = awful.screen.focused().workarea.width
local height = awful.screen.focused().workarea.height
local workarea_x = awful.screen.focused().workarea.x
local workarea_y = awful.screen.focused().workarea.y
local gap_buffer = beautiful.useless_gap * 2

-- Try a popup?

-- local sidebar = wibox({
-- 	visible = false,
-- 	ontop = true,
--     opacity = 0.7,
-- 	width = width * 0.25,
-- 	height = height - dpi(8), -- unknow margin it becomes 24 if double gap
--     x = workarea_x + gap_buffer,
-- 	y = workarea_y + gap_buffer,
-- 	bg = beautiful.bg,
-- 	border_width = dpi(2),
-- 	border_color = color.yellow,
-- 	setup = {
-- 		{
-- 			-- calendar,
-- 			spacing = dpi(20),
-- 			layout = wibox.layout.fixed.vertical,
-- 		},
-- 		margins = { top = dpi(20), bottom = dpi(20) },
-- 		widget = wibox.container.margin,
-- 	},
-- })

-- local sidebar = {}
--
-- sidebar.popup = wibox({
-- 	visible = false,
-- 	ontop = true,
-- 	width = width * 0.25,
-- 	height = height,
-- 	bg = color.magenta,
-- })
--
-- awful.placement.bottom(sidebar.popup, { margins = { bottom = gap_buffer } })
--
-- local calendar = wibox.widget({
-- 	backgrounds_color = color.bg,
-- 	color = color.yellow,
-- 	shape = function(cr, w, h)
-- 		gears.shape.rounded_rect(cr, w, h, 8)
-- 	end,
-- 	max_value = 100,
-- 	widget = wibox.widget.container,
-- })
--
-- sidebar.popup:setup({
-- 	calendar,
-- 	{
-- 		{
-- 			font = "Roboto 24",
-- 			align = "left",
-- 			markup = "<span foreground='" .. color.fg .. "'>🌣</span>",
-- 			widget = wibox.widget.textbox,
-- 		},
-- 		margins = { left = dpi(20), top = dpi(8) },
-- 		widget = wibox.container.margin,
-- 	},
-- 	layout = wibox.layout.stack,
-- })
--
-- sidebar.lifespan = gears.timer({
-- 	timeout = 1,
-- 	call_now = false,
-- 	autostart = false,
-- 	single_shot = true,
-- 	callback = function()
-- 		sidebar.popup.visible = false
-- 	end,
-- })
--
-- awesome.connect_signal("sidebar::toggle", function()
-- 	if sidebar.visible then
-- 		sidebar.visible = not sidebar.visible
-- 	end
-- end)

-- return function(s)
-- 	s.sidebar = awful.popup({
-- 		type = "dock",
-- 		screen = s,
-- 		minimum_height = height,
-- 		maximum_height = height,
-- 		minimum_width = width * 0.25,
-- 		maximum_width = width * 0.25,
-- 		bg = color.magenta,
-- 		ontop = true,
-- 		visible = false,
-- 		placement = function(w)
-- 			awful.placement.top_right(w)
-- 			awful.placement.maximize_vertically(w, { honor_workarea = true, margins = { top = gap_buffer } })
-- 		end,
-- 		widget = {
-- 			{
-- 				{ ----------- MIDDLE GROUP -----------
-- 					{
-- 						{
-- 							-- require("ui.panels.notification-panel.github-activity"),
-- 							somewidget,
-- 							margins = dpi(20),
-- 							widget = wibox.container.margin,
-- 						},
-- 						layout = wibox.layout.fixed.vertical,
-- 					},
-- 					-- shape = helpers.ui.prrect(beautiful.border_radius * 2, true, false, false, false),
-- 					bg = color.red,
-- 					widget = wibox.container.background,
-- 				},
-- 				layout = wibox.layout.flex.vertical,
-- 			},
-- 			-- shape = helpers.ui.prrect(beautiful.border_radius * 2, true, false, false, false),
-- 			bg = color.yellow,
-- 			widget = wibox.container.background,
-- 		},
-- 	})
--
-- 	-- Signal
-- 	awesome.connect_signal("sidebar::toggle", function(scr)
-- 		if scr == s then
-- 			if s.sidebar.visible then
-- 				s.sidebar.visible = not s.sidebar.visible
-- 			end
-- 		end
-- 	end)
-- end
