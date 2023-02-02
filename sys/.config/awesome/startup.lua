local awful = require("awful")
local helper = require("helpers.run")

--- Autostart ---

-- Picom
helper.start_if_not_running("picom", function()
    awful.spawn("picom --config /home/archy/.config/picom/picom.conf", false)
end)

-- Redshift
helper.start_if_not_running("redshift", function()
    awful.spawn("redshift", false)
end)