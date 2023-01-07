--                                                   _     _            _
--   __ ___      _____  ___  ___  _ __ ___   ___    | |__ | | __ _  ___| | __
--  / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \___| '_ \| |/ _` |/ __| |/ /
-- | (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/___| |_) | | (_| | (__|   <
--  \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___|   |_.__/|_|\__,_|\___|_|\_\
--
-- Arch: https://wiki.archlinux.org/title/Awesome
-- Awesome: https://awesomewm.org/apidoc/index.html

pcall(require, "luarocks.loader")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local wibox = require("wibox")

require("error_handler")
require("settings")
require("theme")
require("layout")
require("rules")
require("bindings")
require("tags")
require("menu")
require("bars")

require("signals")

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)
end)

-- Autorun at startup
awful.spawn.with_shell("bash ~/.config/awesome/main/autorun.sh")
