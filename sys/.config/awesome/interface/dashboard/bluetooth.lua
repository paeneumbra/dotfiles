local awful = require("awful")

local widgets = require("helpers.widgets")
local notify = require("helpers.notifications")

local cmd_block_bluetooth = [[
    bluetoothctl power off
    rfkill block bluetooth
]]
local cmd_unblock_bluetooth = [[
    rfkill unblock bluetooth
    sleep 2
    bluetoothctl power on
]]

-- Volume
local bluetooth = widgets.basic_button("󰂯")

bluetooth:connect_signal("button::press", function()
    -- Don't use the signal -  it causes a loop on turn off
    awful.spawn.easy_async_with_shell("rfkill list bluetooth", function(stdout)
        if stdout:match("Soft blocked: yes") then
            awful.spawn.easy_async_with_shell(cmd_unblock_bluetooth, function()
                notify.normal("Bluetooth: on")
            end)
        else
            awful.spawn.easy_async_with_shell(cmd_block_bluetooth, function()
                notify.normal("Bluetooth: off")
            end)
        end
    end)
end)

bluetooth:connect_signal("mouse::enter", function()
    bluetooth.markup = widgets.colored_markup("󰂯", Color.fg)
end)

bluetooth:connect_signal("mouse::leave", function()
    bluetooth.markup = widgets.colored_markup("󰂯", Color.accent)
end)

return bluetooth
