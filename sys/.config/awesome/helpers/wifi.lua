local awful = require("awful")
local notify = require("helpers.notifications")

local _attributes = {}

local cmd_wifi_on = "nmcli radio wifi on"
local cmd_wifi_off = "nmcli radio wifi off"
local cmd_wifi = "nmcli g | tail -1 | awk '{print $1}'"

function _attributes.toggle_wifi()
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

function _attributes.pick(state, signal)
    if signal == nil or signal == 0 or state == false then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰖪</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>OFF</span>",
        }
    elseif signal < 30 then
        return {
            icon = "<span foreground='" .. Color.yellow .. "'>󱛂</span>",
            widget_color = Color.yellow,
            text = "<span foreground='" .. Color.yellow .. "'>" .. signal .. "%</span>",
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰖩</span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. signal .. "%</span>",
        }
    end
end

function _attributes.button_area(state)
    if state == false then
        return {
            markup = "<span foreground='" .. Color.bg .. "'>󰖪</span>",
            background = Color.accent,
        }
    else
        return {
            markup = "<span foreground='" .. Color.accent .. "'>󰖩</span>",
            background = Color.bg,
        }
    end
end

return _attributes
