local widgets = require("helpers.widgets")

-- Wifi
local wifi = widgets.wibar_icon("󰖩", Color.green)

awesome.connect_signal("signal::wifi", function(is_connected, strength)
    if is_connected then
        if strength == nil then
            wifi.markup = widgets.colored_markup("󰖪", Color.red)
        elseif strength < 30 then
            wifi.markup = widgets.colored_markup("󱛂", Color.yellow)
        else
            wifi.markup = widgets.colored_markup("󰖩", Color.green)
        end
    else
        wifi.markup = widgets.colored_markup("󰖪", Color.red)
    end
end)

return wifi
