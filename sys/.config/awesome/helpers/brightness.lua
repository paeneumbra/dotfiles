local awful = require("awful")

local notify = require("helpers.notifications")

local _brightness = {}

local cmd_brightness_increase = "brightnessctl set 10%+"
local cmd_brightness_decrease = "brightnessctl set 10%-"

function _brightness.increase()
    awful.spawn.easy_async_with_shell(cmd_brightness_increase, function()
        notify.normal("Brightness increased")
    end)
end

function _brightness.decrease()
    awful.spawn.easy_async_with_shell(cmd_brightness_decrease, function()
        notify.normal("Brightness decreased")
    end)
end

return _brightness