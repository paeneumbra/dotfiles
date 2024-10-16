local widgets = require "helpers.dashboardwidgets"

-- Wifi signal
local wifi_icon = widgets.simple_icon "󰖩"
local wifi_progressbar = widgets.progressbar(100)
local wifi_text = widgets.simple_text()
local wifi = widgets.bar_group(wifi_icon, wifi_progressbar, wifi_text)

local function update(state, signal)
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

awesome.connect_signal("signal::wifi", function(state, signal)
    att = update(state, signal)
    wifi_progressbar.value = signal
    wifi_icon.markup = att.icon
    wifi_progressbar.color = att.widget_color
    wifi_text.markup = att.text
end)

return wifi
