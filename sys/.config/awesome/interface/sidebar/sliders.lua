local wibox = require "wibox"
local gears = require "gears"

local function bar()
    return function(cr, w, h)
        gears.shape.rounded_bar(cr, w, h)
    end
end

local bar_color = Color.green
local bar_background = Color.bg

local function grouping_widget(group_width, container_width)
    local container = wibox.widget {
        group_width,
        {
            nil,
            container_width,
            expand = "none",
            layout = wibox.layout.align.vertical,
        },
        spacing = xdpi(18),
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

-- Disk
local disk_icon = wibox.widget({
    widget = wibox.widget.textbox,
    font = Bold_Font,
    align = "left",
    markup = "󰋊"
})

local disk_slider = wibox.widget {
    forced_height = xdpi(10),
    color = bar_color,
    background_color = bar_background,
    shape = bar(),
    bar_shape = bar(),
    max_value = 100,
    widget = wibox.widget.progressbar,
}

-- Batteries
local charging_icon = "<span foreground='" .. Color.yellow .. "'>󰢞</span>"

local bat0_icon = wibox.widget({
    widget = wibox.widget.textbox,
    font = Bold_Font,
    align = "left",
    markup = "󰁹"
})

local bat0_slider = wibox.widget {
    forced_height = xdpi(10),
    color = bar_color,
    background_color = bar_background,
    shape = bar(),
    bar_shape = bar(),
    max_value = 100,
    widget = wibox.widget.progressbar,
}

local bat1_icon = wibox.widget({
    widget = wibox.widget.textbox,
    font = Bold_Font,
    align = "left",
    markup = "󰁹"
})

local bat1_slider = wibox.widget {
    forced_height = xdpi(10),
    color = bar_color,
    background_color = bar_background,
    shape = bar(),
    bar_shape = bar(),
    max_value = 100,
    widget = wibox.widget.progressbar,
}

-- Volume

local volume_icon = wibox.widget({
    widget = wibox.widget.textbox,
    font = Bold_Font,
    align = "left",
    markup = "󰕾"
})

local volume_slider = wibox.widget {
    forced_height = xdpi(10),
    color = bar_color,
    background_color = bar_background,
    shape = bar(),
    bar_shape = bar(),
    max_value = 153, -- Max volume is 153%
    widget = wibox.widget.progressbar,
}

local disk = grouping_widget(disk_icon, disk_slider)
local bat0 = grouping_widget(bat0_icon, bat0_slider)
local bat1 = grouping_widget(bat1_icon, bat1_slider)
local volume = grouping_widget(volume_icon, volume_slider)

local function get_stats()
    awesome.connect_signal("signal::disk", function(disk_capacity)
        disk_slider.value = tonumber(disk_capacity)
    end)
    awesome.connect_signal("signal::battery", function(battery0, battery1, charging)
        bat0_slider.value = tonumber(battery0)
        if charging == true then
            bat0_icon.markup = charging_icon
        end
    end)
    awesome.connect_signal("signal::battery", function(battery0, battery1, charging)
        bat1_slider.value = tonumber(battery1)
        if charging == true then
            bat1_icon.markup = charging_icon
        end
    end)
    awesome.connect_signal("signal::volume", function(vol, muted)
        volume_slider.value = vol
        if muted == true then
            volume_icon.markup = "<span foreground='" .. Color.red .. "'>󰖁</span>"
        end
    end)
end

get_stats()

return wrapping_widget(wibox.widget {
    disk,
    bat0,
    bat1,
    volume,
    spacing = xdpi(18),
    layout = wibox.layout.fixed.vertical,
})
