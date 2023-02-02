local awful = require("awful")
local gears = require("gears")

local widgets = require("interface.helpers.widgets")


local cmd_wifi = "nmcli g | tail -1 | awk '{printf $1}'"
local cmd_strength = "awk '/^s*w/ { print  int($3 * 100 / 70) }' /proc/net/wireless"

-- Wifi
local default_markup = widgets.colored_markup("󰖩", Color.green)
local wifi = widgets.basic_icon(default_markup)

local function get_wifi()

    awful.spawn.easy_async_with_shell(cmd_wifi, function(stdout)
        local status = tostring(stdout)
        if not status:match("disconnected") then

            awful.spawn.easy_async_with_shell(cmd_strength, function(stdout)
                local strength

                -- This validation avoids nil errors when connection is down
                if not stdout then
                    strength = 0
                else
                    strength = tonumber(stdout)
                end

                if strength < 30 then
                    wifi.markup =  widgets.colored_markup("󱛂", Color.yellow)
                else
                    wifi.markup = default_markup
                end
            end)
        else
            wifi.markup = widgets.colored_markup("󰖪", Color.red)
        end
    end)
end

gears.timer({
    timeout = 10,
    autostart = true,
    call_now = true,
    callback = function()
        get_wifi()
    end,
})

wifi:connect_signal("button::press", function()
    awful.spawn(Apps.terminal .. " -e nmtui", {
        floating = false,
        tag = mouse.screen.selected_tag,
    })
end)

wifi:connect_signal("mouse::enter", function()
    wifi.markup = widgets.colored_markup("󰖩", Color.gray)
end)

wifi:connect_signal("mouse::leave", function()
    wifi.markup = default_markup
end)

return wifi
