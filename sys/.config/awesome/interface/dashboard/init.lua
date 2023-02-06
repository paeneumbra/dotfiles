local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local volume_attributes = require("helpers.volume")
local bluetooth_attributes = require("helpers.bluetooth")
local wifi_attributes = require("helpers.wifi")

-- widgets
local calendar_widget = require("interface.dashboard.calendar")
local progressbar_widget = require("interface.dashboard.progressbars")
local sliders_widget = require("interface.dashboard.sliders")
local profile_widget = require("interface.dashboard.profile")
local awesome_widget = require("interface.dashboard.awesome")
local uptime_widget = require("interface.dashboard.uptime")

-- buttons
local volume_button = require("interface.dashboard.volume")
local bluetooth_button = require("interface.dashboard.bluetooth")
local wifi_button = require("interface.dashboard.wifi")

-- Screen of 2560x1440
full_screen_height = awful.screen.focused().geometry.height
full_screen_width = awful.screen.focused().geometry.width

-- Screen of 2560x1440 in a grid
dashboard_height = Xdpi(full_screen_height / 10)
dashboard_width = Xdpi(full_screen_width / 20)

local function round_box()
    return function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, 10)
    end
end

function dashboard_box(widgets)
    return wibox.widget {
        {
            widgets,
            margins = Xdpi(20),
            forced_width = dashboard_width,
            forced_height = dashboard_height,
            widget = wibox.container.margin,
        },
        shape = round_box(),
        bg = Color.bg,
        border_width = Xdpi(5),
        border_color = Color.transparent,
        widget = wibox.container.background,
    }
end

local awesome_area = dashboard_box(awesome_widget)
local calendar_area = dashboard_box(calendar_widget)
local progressbar_area = dashboard_box(progressbar_widget)
local sliders_area = dashboard_box(sliders_widget)
local profile_area = dashboard_box(profile_widget)
local uptime_area = dashboard_box(uptime_widget)

local volume_area = dashboard_box(volume_button)
local bluetooth_area = dashboard_box(bluetooth_button)
local wifi_area = dashboard_box(wifi_button)

-- Button updates
local function get_signal()
    awesome.connect_signal("signal::volume", function(_, muted)
        att = volume_attributes.button_area(muted)
        volume_button.markup = att.icon
        volume_area.bg = att.background
    end)
    awesome.connect_signal("signal::bluetooth", function(is_on)
        att = bluetooth_attributes.button_area(is_on)
        bluetooth_button.markup = att.icon
        bluetooth_area.bg = att.background
    end)
    awesome.connect_signal("signal::wifi", function(is_on, _)
        att = wifi_attributes.button_area(is_on)
        wifi_button.markup = att.markup
        wifi_area.bg = att.background
    end)
end

get_signal()

local dashboard_layout = wibox.widget {
    --min_rows_size = dashboard_height,
    --min_cols_size = dashboard_width,
    layout = wibox.layout.grid,
}

-- area states the miminmum size possible of an widget
-- grid layout is a bit quirky
--local area = dashboard_box()
--area.bg = Color.transparent
--dashboard_layout:add_widget_at(area, 11, 21, 1, 1)

-- (widget, row, col, row_span, col_span)
dashboard_layout:add_widget_at(awesome_area, 2, 8, 1, 5)
dashboard_layout:add_widget_at(profile_area, 3, 7, 1, 2)

dashboard_layout:add_widget_at(calendar_area, 3, 9, 3, 3)
dashboard_layout:add_widget_at(uptime_area, 4, 12, 1, 2)

dashboard_layout:add_widget_at(progressbar_area, 5, 12, 3, 5)
dashboard_layout:add_widget_at(sliders_area, 7, 6, 2, 5)

dashboard_layout:add_widget_at(volume_area, 6, 8, 1, 1)
dashboard_layout:add_widget_at(bluetooth_area, 8, 15, 1, 1)
dashboard_layout:add_widget_at(wifi_area, 4, 6, 1, 1)

-- Blurred dashboard
local dashboard = wibox {
    visible = false,
    ontop = true,
    width = full_screen_width,
    height = full_screen_height,
    y = 0,
    x = 0,
}

-- Blurred screen widget setup
dashboard:setup {
    widget = dashboard_layout,
}

-- Timer for closing after button press
dashboard.timer = gears.timer {
    timeout = 0.2,
    single_shot = true,
    callback = function()
        dashboard.visible = not dashboard.visible
    end
}

-- Toggle
dashboard.toggle = function()
    if dashboard.visible then
        dashboard.timer:start()
    else
        dashboard.visible = not dashboard.visible
    end
end

awesome.connect_signal("dashboard::toggle", function()
    -- TODO: Bar is only setting on one screen.
    dashboard.toggle()
end)

return dashboard