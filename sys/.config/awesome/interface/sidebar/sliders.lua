local wibox = require("wibox")

local volume_attributes = require("interface.sidebar.helpers.volume")
local widgets = require("interface.sidebar.helpers.widgets")

-- Volume
local volume_icon = widgets.basic_widget("󰕾")
local volume_slider = widgets.basic_progressbar(153) -- Max volume is 153%
local volume_text = widgets.basic_text()
local volume = widgets.horizontal_group(volume_icon, volume_slider, volume_text)

-- Brightness Level
local brightness_icon = widgets.basic_widget("󰌵")
local brightness_slider = widgets.basic_progressbar(100)
local brightness_text = widgets.basic_text()
local brightness = widgets.horizontal_group(brightness_icon, brightness_slider, brightness_text)

local function get_stats()
    awesome.connect_signal("signal::volume", function(vol, muted)
        att = volume_attributes.pick(vol, muted)
        volume_slider.value = vol
        volume_icon.markup = att.icon
        volume_slider.color = att.widget_color
        volume_text.markup = att.text
    end)

    awesome.connect_signal("signal::brightness", function(brightness_level)
        brightness_slider.value = brightness_level
        brightness_text.markup = widgets.basic_markup(brightness_level, "%")
    end)
end

get_stats()

return widgets.wrapping_widget(wibox.widget {
    volume,
    brightness,
    spacing = xdpi(10),
    layout = wibox.layout.fixed.vertical,
})
