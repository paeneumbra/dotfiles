local wibox = require("wibox")
local gears = require("gears")

local battery_attributes = require("interface.sidebar.helpers.battery")
local cpu_attributes = require("interface.sidebar.helpers.cpu")
local volume_attributes = require("interface.sidebar.helpers.volume")
local widgets = require("interface.sidebar.helpers.widgets")

local function bar()
    return function(cr, w, h)
        gears.shape.rounded_bar(cr, w, h)
    end
end

local bar_color = Color.blue
local bar_background = Color.fg
local bar_height = xdpi(10)

local function grouping_widget(icon, slider)
    local container = wibox.widget {
        icon,
        {
            nil,
            slider,
            expand = "none",
            layout = wibox.layout.align.vertical,
        },
        spacing = xdpi(10),
        layout = wibox.layout.fixed.horizontal,
    }

    return container
end

local function basic_slider(max_bar_value)
    return wibox.widget {
        forced_height = bar_height,
        color = bar_color,
        background_color = bar_background,
        shape = bar(),
        bar_shape = bar(),
        max_value = max_bar_value,
        widget = wibox.widget.progressbar,
    }
end

-- Disk
local disk_icon = widgets.basic_widget("󰋊")
local disk_slider = basic_slider(100)
local disk = grouping_widget(disk_icon, disk_slider)

-- Batteries
local bat0_icon = widgets.basic_widget("󰁹")
local bat0_slider = basic_slider(100)
local bat0 = grouping_widget(bat0_icon, bat0_slider)

local bat1_icon = widgets.basic_widget("󰁹")
local bat1_slider = basic_slider(100)
local bat1 = grouping_widget(bat1_icon, bat1_slider)

-- Volume
local volume_icon = widgets.basic_widget("󰕾")
local volume_slider = basic_slider(153) -- Max volume is 153%
local volume = grouping_widget(volume_icon, volume_slider)

-- CPU Temperature
local cpu_icon = widgets.basic_widget("󰔏")
local cpu_slider = basic_slider(100) --Unknown max, however, 100 = bad
local cpu = grouping_widget(cpu_icon, cpu_slider)

local function get_stats()
    awesome.connect_signal("signal::disk", function(disk_capacity)
        disk_slider.value = tonumber(disk_capacity)
    end)
    awesome.connect_signal("signal::battery", function(battery0, battery1, charging)
        bat0_slider.value = battery0
        bat0_icon.markup = battery_attributes.pick(charging, battery0).icon
        bat0_slider.color = battery_attributes.pick(charging, battery0).slider_color
    end)
    awesome.connect_signal("signal::battery", function(battery0, battery1, charging)
        bat1_slider.value = battery1
        bat1_icon.markup = battery_attributes.pick(charging, battery1).icon
        bat1_slider.color = battery_attributes.pick(charging, battery1).slider_color
    end)
    awesome.connect_signal("signal::volume", function(vol, muted)
        volume_slider.value = vol
        volume_icon.markup = volume_attributes.pick(muted).icon
        volume_slider.color = volume_attributes.pick(muted).slider_color
    end)
    awesome.connect_signal("signal::cpu", function(cpu_temperature)
        cpu_slider.value = cpu_temperature
        cpu_icon.markup = cpu_attributes.pick(cpu_temperature).icon
        cpu_slider.color = cpu_attributes.pick(cpu_temperature).slider_color
    end)
end

-- TODO: brightness
get_stats()

return widgets.wrapping_widget(wibox.widget {
    cpu,
    bat0,
    bat1,
    volume,
    disk,
    spacing = xdpi(10),
    layout = wibox.layout.fixed.vertical,
})
