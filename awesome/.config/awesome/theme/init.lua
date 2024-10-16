local gears = require "gears"
-- Instantiate theme
require("beautiful").init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")

require "theme.theme"
