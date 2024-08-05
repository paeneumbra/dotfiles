local widgets = require "helpers.dashboardwidgets"
local system = require "system.bluetooth"

-- Bluetooth
local bluetooth_button = widgets.dashboard_button "󰂯"
local bluetooth_area = widgets.dashboard_box(bluetooth_button)

bluetooth_button:connect_signal("button::press", function()
    system.toggle_bluetooth()
end)

bluetooth_button:connect_signal("mouse::enter", function()
    bluetooth_button.markup = widgets.recolor("󰂯", Color.fg)
end)

local function update(is_on)
    if is_on then
        return {
            icon = "<span foreground='" .. Color.accent .. "'>󰂯</span>",
            background = Color.bg,
        }
    else
        return {
            icon = "<span foreground='" .. Color.bg .. "'>󰂲</span>",
            background = Color.accent,
        }
    end
end

awesome.connect_signal("signal::bluetooth", function(is_on)
    att = update(is_on)
    bluetooth_button.markup = att.icon
    bluetooth_area.bg = att.background
end)

return bluetooth_area
