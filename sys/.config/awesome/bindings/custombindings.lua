local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

modkey = "Mod4"
alt = "Mod1"

-- App keybinding
awful.keyboard.append_global_keybindings({
	-- Apps

	awful.key({ modkey }, "Return", function()
		awful.spawn(Apps.terminal)
	end, { description = "open alacritty", group = "launcher" }),

	awful.key({ alt }, "Return", function()
		awful.spawn(Apps.alternative_terminal)
	end, { description = "open wezterm", group = "launcher" }),

	awful.key({ alt }, "c", function()
		awful.spawn(Apps.browser)
	end, { description = "open firefox", group = "launcher" }),

	awful.key({ alt }, "f", function()
		awful.spawn(Apps.file_manager)
	end, { description = "open nautilus", group = "launcher" }),

	awful.key({ alt }, "e", function()
		awful.spawn(Apps.email)
	end, { description = "open thunderbird", group = "launcher" }),

	-- Menus

	-- Todo: spawns and closes immediately
	awful.key({ modkey }, "space", function()
		awful.spawn(Apps.launcher, false)
	end, { description = "open app menu", group = "Menus" }),

	awful.key({ alt }, "t", function()
		awful.titlebar.toggle(client.focus)
	end, { description = "toggle titlebar", group = "Menus" }),

	awful.key({ alt }, "s", function()
		awesome.emit_signal("sidebar::toggle")
	end, { description = "toggle sidebar", group = "Menus" }),

	-- Others

	awful.key({ alt }, "i", function()
		hotkeys_popup.show_help(nil, awful.screen.focused())
	end, { description = "show help", group = "Others" }),

})
