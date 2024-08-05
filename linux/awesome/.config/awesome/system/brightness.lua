local awful = require "awful"

local notify = require "helpers.notifications"

local brightness = {}

local cmd_brightness_increase = "brightnessctl set 10%+"
local cmd_brightness_decrease = "brightnessctl set 10%-"

function brightness.increase()
    awful.spawn.easy_async_with_shell(cmd_brightness_increase, function()
        notify.normal "Brightness: Increased"
    end)
end

function brightness.decrease()
    awful.spawn.easy_async_with_shell(cmd_brightness_decrease, function()
        notify.normal "Brightness: Decreased"
    end)
end

function brightness.set(value)
    awful.spawn("brightnessctl set " .. value .. "%", false)
end

return brightness
