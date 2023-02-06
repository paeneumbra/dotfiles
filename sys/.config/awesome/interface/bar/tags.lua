local awful = require("awful")
local wibox = require("wibox")

local widgets = require("helpers.widgets")

-- Tags
local function update_tag(item, tag)
	if tag.selected then
		item:get_children_by_id("tag")[1].markup = widgets.colored_markup("󰄯", Color.blue)
	elseif #tag:clients() > 0 then
		item:get_children_by_id("tag")[1].markup = widgets.colored_markup("󰪡", Color.green)
	else
		item:get_children_by_id("tag")[1].markup = widgets.colored_markup("󰄰", Color.gray)
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
			spacing = Xdpi(5),
			layout = wibox.layout.fixed.horizontal,
		},
		style = {
			spacing = Xdpi(5),
		},
		widget_template = {
			id = "tag",
			font = Icon_Font,
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
