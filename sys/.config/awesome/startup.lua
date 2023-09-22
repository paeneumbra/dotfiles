local awful = require("awful")
local run = require("system.run")
local displays = require("system.displays")

--- Autostart ---

-- Picom
run.start_if_not_running("picom", function()
	awful.spawn("picom --config /home/archy/.config/picom/picom.conf", false)
end)

awful.screen.set_auto_dpi_enabled(true)

-- Display reset
displays.update_displays()


-- Redshift
run.restart("redshift", false)
