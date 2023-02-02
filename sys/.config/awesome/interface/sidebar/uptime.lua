local awful = require("awful")
local gears = require("gears")
local widgets = require("interface.helpers.widgets")

local cmd_uptime = "uptime -p"

local uptime = widgets.basic_icon()

-- Uptime
local function get_status()
    awful.spawn.easy_async_with_shell(cmd_uptime, function(stdout)
        uptime.markup = "󰋚 " .. stdout
    end)
end

gears.timer {
    timeout = 60,
    autostart = true,
    call_now = true,
    callback = function()
        get_status()
    end
}

return uptime