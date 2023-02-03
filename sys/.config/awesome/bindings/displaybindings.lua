local awful = require("awful")

local helper = require("helpers.displays")

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

    awful.key({}, "XF86Display", function()
        helper.update_displays()
    end, { description = "Update displays (F7)", group = "display" }),

    awful.key({ alt }, "d", function()
        helper.update_displays()
    end, { description = "Update displays", group = "display" }),

})
