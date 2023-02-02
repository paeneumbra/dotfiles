local awful = require("awful")

modkey = "Mod4"
alt = "Mod1"

-- Displays

client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move between displays", group = "display" }),
	})
end)

awful.keyboard.append_global_keybindings({
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "display" }),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "display" }),
})
