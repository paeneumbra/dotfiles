local wibox = require "wibox"
local gears = require "gears"

local function bar()
    return function(cr, w, h)
        gears.shape.rounded_bar(cr, w, h)
    end
end

local bar_color = Color.green
local bar_background = Color.bg
local bar_height = xdpi(10)

local function grouping_widget(group_width, container_width)
    local container = wibox.widget {
        group_width,
        {
            nil,
            container_width,
            expand = "none",
            layout = wibox.layout.align.vertical,
        },
        spacing = xdpi(10),
        layout = wibox.layout.fixed.horizontal,
    }

    return container
end

local function wrapping_widget(widget)
    return wibox.widget {
        nil,
        {
            nil,
            widget,
            expand = "none",
            layout = wibox.layout.align.horizontal,
        },
        expand = "none",
        layout = wibox.layout.align.vertical,
    }
end

local function basic_widget(icon)
    return wibox.widget({
        widget = wibox.widget.textbox,
        font = Bold_Font,
        align = "left",
        markup = icon
    })
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
local disk_icon = basic_widget("󰋊")
local disk_slider = basic_slider(100)
local disk = grouping_widget(disk_icon, disk_slider)


-- Batteries
local charging_icon = "<span foreground='" .. Color.yellow .. "'>󰢞</span>"
local empty_icon = "<span foreground='" .. Color.red .. "'>󰁺</span>"

local bat0_icon = basic_widget("󰁹")
local bat0_slider = basic_slider(100)
local bat0 = grouping_widget(bat0_icon, bat0_slider)

local bat1_icon = basic_widget("󰁹")
local bat1_slider = basic_slider(100)
local bat1 = grouping_widget(bat1_icon, bat1_slider)

-- Volume
local volume_icon = basic_widget("󰕾")
local volume_slider = basic_slider(153) -- Max volume is 153%
local volume = grouping_widget(volume_icon, volume_slider)

-- CPU Temperature
local cpu_icon = basic_widget("󰔏")
local cpu_slider = basic_slider(100) --Unknown max, however, 100 = bad
local cpu = grouping_widget(cpu_icon, cpu_slider)

local function get_stats()
    awesome.connect_signal("signal::disk", function(disk_capacity)
        disk_slider.value = tonumber(disk_capacity)
    end)
    awesome.connect_signal("signal::battery", function(battery0, battery1, charging)
        bat0_slider.value = tonumber(battery0)
        if charging == true then
            bat0_icon.markup = charging_icon
        elseif battery0 ~= nil and battery0 < 20 then
            bat0_icon.markup = empty_icon
        end
    end)
    awesome.connect_signal("signal::battery", function(battery0, battery1, charging)
        bat1_slider.value = tonumber(battery1)
        if charging == true then
            bat1_icon.markup = charging_icon
        elseif battery1 ~= nil and battery1 < 20 then
            bat1_icon.markup = empty_icon
        end
    end)
    awesome.connect_signal("signal::volume", function(vol, muted)
        volume_slider.value = vol
        if muted == true then
            volume_icon.markup = "<span foreground='" .. Color.red .. "'>󰖁</span>"
        end
    end)
    awesome.connect_signal("signal::cpu", function(cpu_temperature)
        cpu_slider.value = cpu_temperature
        if cpu_temperature > 70 then
            cpu_icon.markup = "<span foreground='" .. Color.red .. "'>󰈸</span>"
        end
    end)
end

get_stats()

return wrapping_widget(wibox.widget {
    cpu,
    bat0,
    bat1,
    volume,
    disk,
    spacing = xdpi(10),
    layout = wibox.layout.fixed.vertical,
})
