local widgets = require("helpers.widgets")
local helper = require("helpers.wifi")

-- Volume
local wifi = widgets.basic_button("󰖩")

wifi:connect_signal("button::press", function()
    helper.toggle_wifi()
end)

wifi:connect_signal("mouse::enter", function()
    wifi.markup = widgets.colored_markup("󰖩", Color.fg)
end)

return wifi
