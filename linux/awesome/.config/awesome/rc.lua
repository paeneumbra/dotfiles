--
--   __ ___      _____  ___  ___  _ __ ___   ___
--  / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \
-- | (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/
--  \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___|
--
-- Arch: https://wiki.archlinux.org/title/Awesome
-- Awesome: https://awesomewm.org/apidoc/index.html
-- Font Icons: https://pictogrammers.com/library/mdi/

pcall(require, "luarocks.loader")
--
require "awful.autofocus"
--
require "errorhandler"
require "startup"
require "settings"
require "theme"
require "interface"
require "signals"
require "rules"
require "layout"
require "bindings"
require "tags"
--
--- Enable for lower memory consumption
local gears = require "gears"
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
gears.timer {
    timeout = 5,
    autostart = true,
    call_now = true,
    callback = function()
        collectgarbage "collect"
    end,
}
