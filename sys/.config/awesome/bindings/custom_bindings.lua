local awful = require("awful")

-- local volume = require("lib.volume")
-- local brightness = require("lib.brightness")
local xrandr = require("signals.xrandr")

modkey = "Mod4"
alt = "Mod1"

-- App keybinding
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Return", function()
		awful.spawn(Apps.terminal) -- Alacritty
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey }, "space", function()
		awful.spawn(Apps.launcher, false)
	end), -- Rofi
	awful.key({ alt }, "t", function()
		awful.titlebar.toggle(client.focus)
	end), -- Toggle titlebar
    -- 
	awful.key({ alt }, "m", function()
		xrandr.xrandr()
	end), -- Set monitors
    -- TODO
	-- awful.key({ alt }, "c", function()
	-- 	awesome.emit_signal("sidebar::toggle")
	-- end), -- Sidebar
})

-- TODO:
-- -- Volume
-- awful.keyboard.append_global_keybindings({
-- 	awful.key({}, "XF86AudioRaiseVolume", function()
-- 		volume.increase()
-- 	end),
-- 	awful.key({}, "XF86AudioLowerVolume", function()
-- 		volume.decrease()
-- 	end),
-- 	awful.key({}, "XF86AudioMute", function()
-- 		volume.mute()
-- 	end),
-- })
--
-- -- Brightness
-- awful.keyboard.append_global_keybindings({
-- 	awful.key({}, "XF86MonBrightnessUp", function()
-- 		brightness.increase()
-- 	end),
-- 	awful.key({}, "XF86MonBrightnessDown", function()
-- 		brightness.decrease()
-- 	end),
-- })
