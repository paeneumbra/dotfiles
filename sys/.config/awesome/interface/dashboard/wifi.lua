local widgets = require("helpers.dashboardwidgets")
local helper = require("helpers.wifi")

-- Wifi
local wifi = widgets.dashboard_button("󰖩")

wifi:connect_signal("button::press", function()
    helper.toggle_wifi()
end)

wifi:connect_signal("mouse::enter", function()
    wifi.markup = widgets.recolor("󰖩", Color.fg)
end)

return wifi
