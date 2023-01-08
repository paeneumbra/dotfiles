local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local function update_tag(item, tag)
	if tag.selected then
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. color.blue .. "'> </span>"
	elseif #tag:clients() > 0 then
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. color.green .. "'> </span>"
	else
		item:get_children_by_id("tag")[1].markup = "<span foreground='" .. color.gray .. "'> </span>"
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
			spacing = dpi(2),
			layout = wibox.layout.fixed.horizontal,
		},
		style = {
			spacing = dpi(2),
		},
		widget_template = {
			id = "tag",
			font = "Iosevka Nerd Font 8",
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
