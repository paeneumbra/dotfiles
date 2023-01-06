local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local function update_tag(item, tag, index)
	if tag.selected then
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. color.blue .. "'>◆</span>"
	elseif #tag:clients() > 0 then
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. color.green .. "'>◇</span>"
	else
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. color.gray .. "'>◇</span>"
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
			spacing = dpi(4),
			layout = wibox.layout.fixed.horizontal,
		},
		style = {
			spacing = dpi(10), --[[
fg_focus = beautiful.red,
fg_empty = beautiful.bg_alt,
fg_occupied = beautiful.fg --]]
		},
		widget_template = {
			id = "tag",
			font = "Roboto Medium 14",
			widget = wibox.widget.textbox,

			create_callback = function(self, c3, index, object)
				update_tag(self, c3, index)
			end,

			update_callback = function(self, c3, index, object)
				update_tag(self, c3, index)
			end,
		},
	})

	return tag
end
