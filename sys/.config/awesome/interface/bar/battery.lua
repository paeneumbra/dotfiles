local widgets = require("helpers.wibar_widgets")

-- Battery
local battery = widgets.wibar_icon("󱊣", Color.green)

awesome.connect_signal("signal::battery", function(bat_zero, bat_one, charging)
    -- Battery signals are not available immediately after startup
    -- This validation avoids error messages
    if not bat_zero and not bat_one then
        capacity = 0
    else
        -- This adds both batteries resulting in values until 200%
        capacity = bat_zero + bat_one
    end
    if charging then
        battery.markup = widgets.recolor("󰚥", Color.green)
    elseif capacity < 40 then
        battery.markup = widgets.recolor("󱊡", Color.red)
    elseif bat_one < 25 or capacity < 50 then
        battery.markup = widgets.recolor("󱊢", Color.yellow)
    else
        battery.markup = widgets.recolor("󱊣", Color.green)
    end
end)

return battery
