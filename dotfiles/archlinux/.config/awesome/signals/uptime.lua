local awful = require("awful")
local gears = require("gears")

local cmd_uptime = "uptime -p"

local function get_status()
    awful.spawn.easy_async_with_shell(cmd_uptime, function(stdout)
        uptime = tostring(stdout)
        awesome.emit_signal("signal::uptime", uptime)
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
