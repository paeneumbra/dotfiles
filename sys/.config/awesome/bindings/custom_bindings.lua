local awful = require("awful")
local sidebar = require("interface.sidebar")

local xrandr = require("interface.xrandr")

modkey = "Mod4"
alt = "Mod1"

-- App keybinding
awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, "Return", function()
        awful.spawn(Apps.terminal) -- Alacritty
    end, { description = "open alacritty", group = "launcher" }),
    awful.key({ alt }, "c", function()
        awful.spawn(Apps.browser) -- Firefox
    end, { description = "open firefox", group = "launcher" }),
    awful.key({ modkey }, "space", function()
        awful.spawn(Apps.launcher, false)
    end), -- Rofi
    awful.key({ alt }, "t", function()
        awful.titlebar.toggle(client.focus)
    end), -- Toggle titlebar
    awful.key({ alt }, "s", function()
        awesome.emit_signal("sidebar::toggle")
    end), -- Toggle sidebar
    awful.key({}, "Escape", function()
        if sidebar.visible then
            awesome.emit_signal("sidebar::toggle")
        end
    end), -- Close sidebar
    --
    awful.key({}, "XF86Display", function()
        awesome.emit_signal("displays::toggle")
    end), -- Set monitors
})
