local widgets = require("helpers.dashboardwidgets")
local helper = require("helpers.wifi")

-- Volume
local wifi = widgets.dashboard_button("󰖩")

wifi:connect_signal("button::press", function()
    helper.toggle_wifi()
end)

wifi:connect_signal("mouse::enter", function()
    wifi.markup = widgets.recolor("󰖩", Color.fg)
end)

return wifi
