local wibox = require("wibox")

local widgets = require("helpers.dashboardwidgets")

local battery_attributes = require("helpers.battery")
local cpu_attributes = require("helpers.cpu")
local disk_attributes = require("helpers.disk")
local wifi_attributes = require("helpers.wifi")

-- Disk
local disk_icon = widgets.simple_icon("󰋊")
local disk_progressbar = widgets.progressbar(100)
local disk_text = widgets.simple_text()
local disk = widgets.bar_group(disk_icon, disk_progressbar, disk_text)

-- Batteries
local bat0_icon = widgets.simple_icon("󰁹")
local bat0_progressbar = widgets.progressbar(100)
local bat0_text = widgets.simple_text()
local bat0 = widgets.bar_group(bat0_icon, bat0_progressbar, bat0_text)

local bat1_icon = widgets.simple_icon("󰁹")
local bat1_progressbar = widgets.progressbar(100)
local bat1_text = widgets.simple_text()
local bat1 = widgets.bar_group(bat1_icon, bat1_progressbar, bat1_text)

-- CPU Temperature
local cpu_icon = widgets.simple_icon("󰔏")
local cpu_progressbar = widgets.progressbar(100) --Unknown max, however, 100 = bad
local cpu_text = widgets.simple_text()
local cpu = widgets.bar_group(cpu_icon, cpu_progressbar, cpu_text)

-- Wifi signal
local wifi_icon = widgets.simple_icon("󰔏")
local wifi_progressbar = widgets.progressbar(100)
local wifi_text = widgets.simple_text()
local wifi = widgets.bar_group(wifi_icon, wifi_progressbar, wifi_text)

local function get_stats()
    awesome.connect_signal("signal::disk", function(disk_capacity)
        att = disk_attributes.pick(disk_capacity)
        disk_progressbar.value = disk_capacity
        disk_icon.markup = att.icon
        disk_progressbar.color = att.widget_color
        disk_text.markup = att.text
    end)
    awesome.connect_signal("signal::battery", function(battery0, _, charging)
        att = battery_attributes.pick(charging, battery0)
        bat0_progressbar.value = battery0
        bat0_icon.markup = att.icon
        bat0_progressbar.color = att.widget_color
        bat0_text.markup = att.text
    end)
    awesome.connect_signal("signal::battery", function(_, battery1, charging)
        att = battery_attributes.pick(charging, battery1)
        bat1_progressbar.value = battery1
        bat1_icon.markup = att.icon
        bat1_progressbar.color = att.widget_color
        bat1_text.markup = att.text
    end)
    awesome.connect_signal("signal::cpu", function(cpu_temperature)
        att = cpu_attributes.pick(cpu_temperature)
        cpu_progressbar.value = cpu_temperature
        cpu_icon.markup = att.icon
        cpu_progressbar.color = att.widget_color
        cpu_text.markup = att.text
    end)
    awesome.connect_signal("signal::wifi", function(state, signal)
        att = wifi_attributes.pick(state, signal)
        wifi_progressbar.value = signal
        wifi_icon.markup = att.icon
        wifi_progressbar.color = att.widget_color
        wifi_text.markup = att.text
    end)
end

get_stats()

return widgets.wrapping_widget(wibox.widget {
    cpu,
    bat0,
    bat1,
    disk,
    wifi,
    spacing = Xdpi(30),
    layout = wibox.layout.fixed.vertical,
})
