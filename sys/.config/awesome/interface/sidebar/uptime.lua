local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local cmd_uptime = "uptime -p"

local function basic_widget()
    return wibox.widget({
        font = Bold_Font,
        align = "center",
        widget = wibox.widget.textbox,
    })
end

local uptime = basic_widget()

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