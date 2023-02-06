local awful = require("awful")
local gears = require("gears")

local cmd_wifi = "nmcli g | tail -1 | awk '{print $1}'"
local cmd_strength = "awk '/^s*w/ { print  int($3 * 100 / 70) }' /proc/net/wireless"

-- Wifi
local function get_wifi()
    awful.spawn.easy_async_with_shell(cmd_wifi, function(state)
        local status = tostring(state)
        if string.match(status, "disconnected") or string.match(status, "asleep") then
            awesome.emit_signal("signal::wifi", false, nil)
        else
            awful.spawn.easy_async_with_shell(cmd_strength, function(stdout)
                -- This validation avoids nil errors when connection is down
                if stdout == nil then
                    strength = 0
                else
                    strength = tonumber(stdout)
                end
                awesome.emit_signal("signal::wifi", true, strength)
            end)
        end
    end)
end

gears.timer({
    timeout = 5,
    autostart = true,
    call_now = true,
    callback = function()
        get_wifi()
    end,
})
