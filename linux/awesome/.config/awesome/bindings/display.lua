local awful = require "awful"

local displays = require "system.displays"

-- Displays

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings {
        awful.key({ MetaKey }, "o", function(c)
            c:move_to_screen()
        end, { description = "move between displays", group = "display" }),
    }
end)

awful.keyboard.append_global_keybindings {
    awful.key({ MetaKey, "Control" }, "j", function()
        awful.screen.focus_relative(1)
    end, { description = "focus the next screen", group = "display" }),
    awful.key({ MetaKey, "Control" }, "k", function()
        awful.screen.focus_relative(-1)
    end, { description = "focus the previous screen", group = "display" }),

    awful.key({}, "XF86Display", function()
        displays.update_displays()
    end, { description = "Update displays (F7)", group = "display" }),

    awful.key({ AltKey }, "r", function()
        displays.update_displays()
    end, { description = "Reload displays", group = "display" }),
}
