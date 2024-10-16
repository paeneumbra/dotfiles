local awful = require "awful"
local gears = require "gears"

local cmd_bluetooth = "rfkill list bluetooth"

local function get_state()
    awful.spawn.easy_async_with_shell(cmd_bluetooth, function(stdout)
        if stdout:match "Soft blocked: yes" then
            bluetooth_state = false
        else
            bluetooth_state = true
        end

        awesome.emit_signal("signal::bluetooth", bluetooth_state)
    end)
end

gears.timer {
    timeout = 5,
    call_now = true,
    autostart = true,
    callback = function()
        get_state()
    end,
}
