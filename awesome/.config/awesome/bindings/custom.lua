local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"

local volume = require "system.volume"
local brightness = require "system.brightness"
local printscreen = require "system.printscreen"

alt = "Mod1"
meta = "Mod4"

-- App keybinding
awful.keyboard.append_global_keybindings {
    -- Apps

    awful.key({ alt }, "Return", function()
        awful.spawn(Apps.terminal)
    end, { description = "open alacritty", group = "launcher" }),

    awful.key({ alt, meta }, "Return", function()
        awful.spawn(Apps.alternative_terminal)
    end, { description = "open urxvt", group = "launcher" }),

    awful.key({ meta }, "c", function()
        awful.spawn(Apps.browser)
    end, { description = "open firefox", group = "launcher" }),

    awful.key({ meta }, "f", function()
        awful.spawn(Apps.file_manager)
    end, { description = "open thunar", group = "launcher" }),

    -- awful.key({ meta }, "e", function()
    --     awful.spawn(Apps.email)
    -- end, { description = "open thunderbird", group = "launcher" }),

    -- Todo: spawns and closes immediately
    awful.key({ alt }, "space", function()
        awful.spawn(Apps.launcher, false)
    end, { description = "open app menu", group = "Menus" }),

    awful.key({ meta }, "Tab", function()
        awful.spawn("rofi -theme base -modi window -show window", false)
    end, { description = "open window switcher menu", group = "Menus" }),

    awful.key({ meta }, "t", function()
        awful.titlebar.toggle(client.focus)
    end, { description = "toggle titlebar", group = "Menus" }),

    awful.key({ meta }, "d", function()
        awesome.emit_signal "dashboard::toggle"
    end, { description = "toggle dashboard", group = "Menus" }),

    awful.key({ meta }, "x", function()
        awesome.emit_signal "power::toggle"
    end, { description = "toggle power menu", group = "Menus" }),

    -- Volume

    awful.key({}, "XF86AudioMute", function()
        volume.toggle_volume()
    end, { description = "Mute/Unmute (F1)", group = "Volume" }),

    awful.key({}, "XF86AudioLowerVolume", function()
        volume.decrease()
    end, { description = "Decrease Volume (F2)", group = "Volume" }),

    awful.key({}, "XF86AudioRaiseVolume", function()
        volume.increase()
    end, { description = "Increase Volume (F3)", group = "Volume" }),

    -- Brightness

    awful.key({}, "XF86MonBrightnessDown", function()
        brightness.decrease()
    end, { description = "Decrease brightness (F5)", group = "Volume" }),

    awful.key({}, "XF86MonBrightnessUp", function()
        brightness.increase()
    end, { description = "Increase brightness (F6)", group = "Volume" }),

    -- Others

    awful.key({ meta }, "p", function()
        printscreen.print_selected_area()
    end, { description = "Print screen selected area", group = "Others" }),

    awful.key({ meta }, "i", function()
        hotkeys_popup.show_help(nil, awful.screen.focused())
    end, { description = "show help", group = "Others" }),
}
