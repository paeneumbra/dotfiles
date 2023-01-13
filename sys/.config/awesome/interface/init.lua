local gears = require("gears")

require("beautiful").init(gears.filesystem.get_configuration_dir() .. "interface/theme/theme.lua")
require("interface.wallpaper")
require("interface.menu")
require("interface.titlebar")
require("interface.bar")
require("interface.sidebar")
