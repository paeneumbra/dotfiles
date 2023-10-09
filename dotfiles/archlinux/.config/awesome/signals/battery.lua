local awful = require("awful")
local gears = require("gears")

-- This accommodates the presence of two batteries
local cmd_battery_zero = "cat /sys/class/power_supply/BAT0/capacity 2>/dev/null | head -1"
local cmd_battery_one = "cat /sys/class/power_supply/BAT1/capacity 2>/dev/null | head -1"
local cmd_charging_zero = "cat /sys/class/power_supply/BAT0/status"
local cmd_charging_one = "cat /sys/class/power_supply/BAT1/status"

local function get_bat()
    awful.spawn.easy_async_with_shell(cmd_battery_zero, function(bat0)
        if bat0 then
            remainder_battery_zero = tonumber(bat0)
        else
            remainder_battery_zero = 0
        end
    end)

    awful.spawn.easy_async_with_shell(cmd_battery_one, function(bat1)
        if bat1 then
            remainder_battery_one = tonumber(bat1)
        else
            remainder_battery_one = 0
        end
    end)

    awful.spawn.easy_async_with_shell(cmd_charging_zero, function(cbat0)
        if string.find(cbat0, "Charging") then
            charging_bat0 = true
        else
            charging_bat0 = false
        end
    end)

    awful.spawn.easy_async_with_shell(cmd_charging_one, function(cbat1)
        if string.find(cbat1, "Charging") then
            charging_bat1 = true
        else
            charging_bat1 = false
        end
    end)

    charging = charging_bat1 or charging_bat0

    awesome.emit_signal("signal::battery", remainder_battery_zero, remainder_battery_one, charging)
end

gears.timer({
    timeout = 10,
    call_now = true,
    autostart = true,
    callback = function()
        get_bat()
    end,
})
