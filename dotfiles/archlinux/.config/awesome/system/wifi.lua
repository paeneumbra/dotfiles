local awful = require("awful")
local notify = require("helpers.notifications")

local wifi = {}

local cmd_wifi_on = "nmcli radio wifi on"
local cmd_wifi_off = "nmcli radio wifi off"
local cmd_wifi = "nmcli g | tail -1 | awk '{print $1}'"

function wifi.toggle_wifi()
    awful.spawn.easy_async_with_shell(cmd_wifi, function(state)
        local status = tostring(state)
        if string.match(status, "disconnected") or string.match(status, "asleep") then
            awful.spawn.easy_async_with_shell(cmd_wifi_on, function()
                notify.normal("Wifi: on")
            end)
        else
            awful.spawn.easy_async_with_shell(cmd_wifi_off, function()
                notify.normal("Wifi: off")
            end)
        end
    end)
end

return wifi
