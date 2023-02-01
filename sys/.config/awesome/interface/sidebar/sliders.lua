local wibox = require("wibox")

local battery_attributes = require("interface.sidebar.helpers.battery")
local cpu_attributes = require("interface.sidebar.helpers.cpu")
local volume_attributes = require("interface.sidebar.helpers.volume")
local widgets = require("interface.sidebar.helpers.widgets")

-- Disk
local disk_icon = widgets.basic_widget("󰋊")
local disk_slider = widgets.basic_slider(100)
local disk_text = widgets.basic_text()
local disk_stack = widgets.basic_stack(disk_slider, disk_text)
local disk = widgets.grouping_widget(disk_icon, disk_stack)

-- Batteries
local bat0_icon = widgets.basic_widget("󰁹")
local bat0_slider = widgets.basic_slider(100)
local bat0_text = widgets.basic_text()
local bat0_stack = widgets.basic_stack(bat0_slider, bat0_text)
local bat0 = widgets.grouping_widget(bat0_icon, bat0_stack)

local bat1_icon = widgets.basic_widget("󰁹")
local bat1_slider = widgets.basic_slider(100)
local bat1_text = widgets.basic_text()
local bat1_stack = widgets.basic_stack(bat1_slider, bat1_text)
local bat1 = widgets.grouping_widget(bat1_icon, bat1_stack)

-- Volume
local volume_icon = widgets.basic_widget("󰕾")
local volume_slider = widgets.basic_slider(153) -- Max volume is 153%
local volume_text = widgets.basic_text()
local volume_stack = widgets.basic_stack(volume_slider, volume_text)
local volume = widgets.grouping_widget(volume_icon, volume_stack)

-- CPU Temperature
local cpu_icon = widgets.basic_widget("󰔏")
local cpu_slider = widgets.basic_slider(100) --Unknown max, however, 100 = bad
local cpu_text = widgets.basic_text()
local cpu_stack = widgets.basic_stack(cpu_slider, cpu_text)
local cpu = widgets.grouping_widget(cpu_icon, cpu_stack)

-- Brightness Level
local brightness_icon = widgets.basic_widget("󰌵")
local brightness_slider = widgets.basic_slider(100) --Unknown max, however, 100 = bad
local brightness_text = widgets.basic_text()
local brightness_stack = widgets.basic_stack(brightness_slider, brightness_text)
local brightness = widgets.grouping_widget(brightness_icon, brightness_stack)

local function get_stats()
    awesome.connect_signal("signal::disk", function(disk_capacity)
        disk_slider.value = tonumber(disk_capacity)
        disk_text.markup = widgets.slider_text(disk_capacity, "%")
    end)
    awesome.connect_signal("signal::battery", function(battery0, battery1, charging)
        bat0_slider.value = battery0
        bat0_icon.markup = battery_attributes.pick(charging, battery0).icon
        bat0_slider.color = battery_attributes.pick(charging, battery0).slider_color
        bat0_text.markup = widgets.slider_text(battery0, "%")
    end)
    awesome.connect_signal("signal::battery", function(battery0, battery1, charging)
        bat1_slider.value = battery1
        bat1_icon.markup = battery_attributes.pick(charging, battery1).icon
        bat1_slider.color = battery_attributes.pick(charging, battery1).slider_color
        bat1_text.markup = widgets.slider_text(battery1, "%")
    end)
    awesome.connect_signal("signal::volume", function(vol, muted)
        volume_slider.value = vol
        volume_icon.markup = volume_attributes.pick(muted).icon
        volume_slider.color = volume_attributes.pick(muted).slider_color
        volume_text.markup = widgets.slider_text(vol, "%")
    end)
    awesome.connect_signal("signal::cpu", function(cpu_temperature)
        cpu_slider.value = cpu_temperature
        cpu_icon.markup = cpu_attributes.pick(cpu_temperature).icon
        cpu_slider.color = cpu_attributes.pick(cpu_temperature).slider_color
        cpu_text.markup = widgets.slider_text(cpu_temperature, "°C")
    end)
    awesome.connect_signal("signal::brightness", function(brightness_level)
        brightness_slider.value = brightness_level
        brightness_text.markup = widgets.slider_text(brightness_level, "%")
    end)
end

-- TODO: brightness
get_stats()

return widgets.wrapping_widget(wibox.widget {
    cpu,
    bat0,
    bat1,
    volume,
    brightness,
    disk,
    spacing = xdpi(10),
    layout = wibox.layout.fixed.vertical,
})
