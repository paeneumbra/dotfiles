local awful = require "awful"
local gears = require "gears"

local cmd_brightness = "brightnessctl | head -2 | tail -1 | awk '{printf $4}' | cut -c 2-5 | cut -d '%' -f -1"

local function brightnessctl()
    awful.spawn.easy_async_with_shell(cmd_brightness, function(stdout)
        local brightness = tonumber(stdout)
        awesome.emit_signal("signal::brightness", brightness)
    end)
end

gears.timer {
    timeout = 5,
    call_now = true,
    autostart = true,
    callback = function()
        brightnessctl()
    end,
}
