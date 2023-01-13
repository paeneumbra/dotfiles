local wibox = require('wibox')
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- New attempt:
-- https://github.com/JavaCafe01/dotfiles/tree/master/config/awesome/ui/notifs

local header = wibox.widget {
	markup = "Sidebar",
	font = Font,
	align = 'center',
	valign = 'center',
	widget = wibox.widget.textbox
}

return wibox.widget {
	{
		nil,
		nil,
		--require("ui.notifs.notif-center.clear-all"),
		expand = "none",
		spacing = dpi(10),
		layout = wibox.layout.align.horizontal
	},
	--require('ui.notifs.notif-center.build-notifbox'),

	spacing = dpi(10),
	layout = wibox.layout.fixed.vertical
}