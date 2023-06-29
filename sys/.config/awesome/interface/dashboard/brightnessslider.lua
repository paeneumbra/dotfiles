local system = require("system.brightness")

local widgets = require("helpers.dashboardwidgets")


-- Brightness Level
local brightness_icon = widgets.simple_icon("󰖙")
local brightness_slider = widgets.slider(100)
local brightness_text = widgets.simple_text()
local brightness = widgets.bar_group(brightness_icon, brightness_slider, brightness_text)

brightness_slider:connect_signal("property::value", function(_, value)
    system.set(value)
end)

awesome.connect_signal("signal::brightness", function(brightness_level)
    brightness_slider.value = brightness_level
    brightness_text.markup = widgets.recolor(brightness_level .. "%", Color.fg)
end)

return brightness
