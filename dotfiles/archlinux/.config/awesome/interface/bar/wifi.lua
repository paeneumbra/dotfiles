local system = require "system.wifi"
local widgets = require "helpers.wibarwidgets"

-- Wifi
local wifi = widgets.wibar_icon("󰖩", Color.green)

awesome.connect_signal("signal::wifi", function(is_connected, strength)
    if is_connected then
        if strength == nil then
            wifi.markup = widgets.recolor("󰖪", Color.red)
        elseif strength < 30 then
            wifi.markup = widgets.recolor("󱛂", Color.yellow)
        else
            wifi.markup = widgets.recolor("󰖩", Color.green)
        end
    else
        wifi.markup = widgets.recolor("󰖪", Color.red)
    end
end)

wifi:connect_signal("button::press", function()
    system.toggle_wifi()
end)

wifi:connect_signal("mouse::enter", function()
    wifi.markup = widgets.recolor("󰖩", Color.fg)
end)

wifi:connect_signal("mouse::leave", function()
    wifi.markup = widgets.recolor("󰖩", Color.green)
end)

return wifi
