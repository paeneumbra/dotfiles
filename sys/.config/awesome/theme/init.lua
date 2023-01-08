local gears = require("gears")

require("beautiful").init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")
require("theme.menu")
