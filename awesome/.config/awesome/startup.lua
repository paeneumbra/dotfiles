local awful = require "awful"
local run = require "system.run"
local displays = require "system.displays"

--- Autostart ---

-- Picom
run.start_if_not_running("picom", function()
    awful.spawn("picom", false)
end)

-- Display reset
displays.update_displays()

-- Redshift
run.restart "redshift"
