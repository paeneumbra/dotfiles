local awful = require("awful")
local gears = require("gears")

-- This accommodates the presence of two batteries

local battery_zero = "cat /sys/class/power_supply/BAT0/capacity 2>/dev/null | head -1"
local battery_one = "cat /sys/class/power_supply/BAT1/capacity 2>/dev/null | head -1"
local charging_zero = "cat /sys/class/power_supply/BAT0/status"
local charging_one = "cat /sys/class/power_supply/BAT1/status"

local remainder_battery_zero
local remainder_battery_one
local charging_battery = false

local function get_bat()
    awful.spawn.easy_async_with_shell(battery_zero, function(bat0)
        if bat0 then
            remainder_battery_zero = tonumber(bat0)
        else
            remainder_battery_zero = 0
        end
    end)

    awful.spawn.easy_async_with_shell(battery_one, function(bat1)
        if bat1 then
            remainder_battery_one = tonumber(bat1)
        else
            remainder_battery_one = 0
        end
    end)

    awful.spawn.easy_async_with_shell(charging_zero, function(bat0)
        if string.find(bat0, "Charging") then
            charging_battery = true
        end
    end)

    awful.spawn.easy_async_with_shell(charging_one, function(bat1)
        if string.find(bat1, "Charging") then
            charging_battery = true
        end
    end)

    awesome.emit_signal("signal::battery", remainder_battery_zero, remainder_battery_one, charging_battery)
end

gears.timer({
    timeout = 10,
    call_now = true,
    autostart = true,
    callback = function()
        get_bat()
    end,
})
