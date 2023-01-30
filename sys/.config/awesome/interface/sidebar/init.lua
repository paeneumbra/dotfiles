local wibox = require('wibox')

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
		spacing = xdpi(10),
		layout = wibox.layout.align.horizontal
	},
	--require('ui.notifs.notif-center.build-notifbox'),

	spacing = xdpi(10),
	layout = wibox.layout.fixed.vertical
}