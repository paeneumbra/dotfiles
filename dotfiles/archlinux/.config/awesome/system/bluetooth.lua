local awful = require "awful"
local notify = require "helpers.notifications"

local bluetooth = {}

local cmd_block_bluetooth = [[
    bluetoothctl power off
    rfkill block bluetooth
]]
local cmd_unblock_bluetooth = [[
    rfkill unblock bluetooth
    sleep 2
    bluetoothctl power on
]]

function bluetooth.toggle_bluetooth()
    awful.spawn.easy_async_with_shell("rfkill list bluetooth", function(stdout)
        if stdout:match "Soft blocked: yes" then
            awful.spawn.easy_async_with_shell(cmd_unblock_bluetooth, function()
                notify.normal "Bluetooth: on"
            end)
        else
            awful.spawn.easy_async_with_shell(cmd_block_bluetooth, function()
                notify.normal "Bluetooth: off"
            end)
        end
    end)
end

return bluetooth
