local wibox = require("wibox")

local widgets = require("helpers.dashboardwidgets")

local brightness = require("interface.dashboard.brightnessslider")
local volume = require("interface.dashboard.volumeslider")

return widgets.wrapping_widget(wibox.widget {
    volume,
    brightness,
    spacing = Xdpi(20),
    layout = wibox.layout.fixed.vertical,
})
