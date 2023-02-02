local awful = require("awful")
local wibox = require("wibox")

-- Create tasklist
return function(s)
	local update_task = function(self, c)
		if c.active then
			self:get_children_by_id("bg")[1].bg = Color.blue
			return
		elseif c.minimized then
			self:get_children_by_id("bg")[1].bg = Color.bg .. "4d"
			return
		else
			self:get_children_by_id("bg")[1].bg = Color.gray
		end
	end

	local task = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = {
			awful.button({}, 1, function(c)
				c:activate({ context = "tasklist", action = "toggle_minimization" })
			end),
		},
		layout = {
			spacing = Xdpi(1),
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			{
				{
					id = "client",
					widget = awful.widget.clienticon,
				},
				margins = Xdpi(3),
				widget = wibox.container.margin,
			},
			id = "bg",
			bg = Color.bg,
			widget = wibox.container.background,

			create_callback = function(self, c, _, __)
				self:get_children_by_id("client")[1].client = c
				update_task(self, c)
			end,

			update_callback = function(self, c, _, __)
				self:get_children_by_id("client")[1].client = c
				update_task(self, c)
			end,
		},
	})

	return task
end
