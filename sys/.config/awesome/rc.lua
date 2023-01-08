--                                                   _     _            _
--   __ ___      _____  ___  ___  _ __ ___   ___    | |__ | | __ _  ___| | __
--  / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \___| '_ \| |/ _` |/ __| |/ /
-- | (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/___| |_) | | (_| | (__|   <
--  \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___|   |_.__/|_|\__,_|\___|_|\_\
--
-- Arch: https://wiki.archlinux.org/title/Awesome
-- Awesome: https://awesomewm.org/apidoc/index.html

pcall(require, "luarocks.loader")

local awful = require("awful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

require("error_handler")
require("settings")
require("theme")
require("signals")
require("rules")
require("wallpaper")
require("layout")
require("bindings")
require("tags")
require("bars")

-- Autorun at startup
-- awful.spawn.with_shell("picom /home/archy/.config/picom/picom.conf")
awful.spawn.with_shell("sh -c 'pgrep picom > /dev/null && pkill picom || picom --config /home/archy/.config/picom/picom.conf & disown'")
