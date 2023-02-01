local wibox = require("wibox")

local volume_attributes = require("interface.sidebar.helpers.volume")
local widgets = require("interface.sidebar.helpers.widgets")

-- Volume
local volume_icon = widgets.basic_widget("󰕾")
local volume_slider = widgets.basic_progressbar(153) -- Max volume is 153%
local volume_text = widgets.basic_text()
local volume_stack = widgets.basic_stack(volume_slider, volume_text)
local volume = widgets.grouping_widget(volume_icon, volume_stack)

-- Brightness Level
local brightness_icon = widgets.basic_widget("󰌵")
local brightness_slider = widgets.basic_progressbar(100)
local brightness_text = widgets.basic_text()
local brightness_stack = widgets.basic_stack(brightness_slider, brightness_text)
local brightness = widgets.grouping_widget(brightness_icon, brightness_stack)

local function get_stats()
    awesome.connect_signal("signal::volume", function(vol, muted)
        volume_slider.value = vol
        volume_icon.markup = volume_attributes.pick(muted).icon
        volume_slider.color = volume_attributes.pick(muted).widget_color
        volume_text.markup = widgets.basic_markup(vol, "%")
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
