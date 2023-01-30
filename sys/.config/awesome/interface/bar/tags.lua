local awful = require("awful")
local wibox = require("wibox")

local function update_tag(item, tag)
	if tag.selected then
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. Color.blue .. "'> </span>"
	elseif #tag:clients() > 0 then
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. Color.green .. "'> </span>"
	else
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. Color.gray .. "'> </span>"
	end
end

local button = awful.button({}, 1, function(t)
	t:view_only()
end)

return function(s)
	local tag = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = button,
		layout = {
			spacing = xdpi(2),
			layout = wibox.layout.fixed.horizontal,
		},
		style = {
			spacing = xdpi(2),
		},
		widget_template = {
			id = "tag",
			font = Font,
			widget = wibox.widget.textbox,

			create_callback = function(self, c3)
				update_tag(self, c3)
			end,

			update_callback = function(self, c3)
				update_tag(self, c3)
			end,
		},
	})

	return tag
end
