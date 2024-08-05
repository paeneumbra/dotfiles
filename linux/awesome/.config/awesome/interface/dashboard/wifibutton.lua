local widgets = require "helpers.dashboardwidgets"
local system = require "system.wifi"

-- Wifi
local wifi_button = widgets.dashboard_button "󰖩"
local wifi_area = widgets.dashboard_box(wifi_button)

wifi_button:connect_signal("button::press", function()
    system.toggle_wifi()
end)

wifi_button:connect_signal("mouse::enter", function()
    wifi_button.markup = widgets.recolor("󰖩", Color.fg)
end)

local function update(state)
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

awesome.connect_signal("signal::wifi", function(is_on, _)
    att = update(is_on)
    wifi_button.markup = att.markup
    wifi_area.bg = att.background
end)

return wifi_area
