local gears = require("gears")
local wibox = require("wibox")

-- helpers
local helper = require("helpers.dashboardwidgets")
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

-- boxes
local awesome_area = helper.dashboard_box(awesome_widget)
local calendar_area = helper.dashboard_box(calendar_widget)
local progressbar_area = helper.dashboard_box(progressbar_widget)
local sliders_area = helper.dashboard_box(sliders_widget)
local profile_area = helper.dashboard_box(profile_widget)
local uptime_area = helper.dashboard_box(uptime_widget)

local volume_area = helper.dashboard_box(volume_button)
local bluetooth_area = helper.dashboard_box(bluetooth_button)
local wifi_area = helper.dashboard_box(wifi_button)

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

local dashboard_grid = wibox.widget {
    layout = wibox.layout.grid,
}

-- (widget, row, col, row_span, col_span)
dashboard_grid:add_widget_at(awesome_area, 2, 8, 1, 5)
dashboard_grid:add_widget_at(profile_area, 3, 7, 1, 2)

dashboard_grid:add_widget_at(calendar_area, 3, 9, 3, 3)
dashboard_grid:add_widget_at(uptime_area, 4, 12, 1, 2)

dashboard_grid:add_widget_at(progressbar_area, 5, 12, 3, 5)
dashboard_grid:add_widget_at(sliders_area, 7, 6, 2, 5)

dashboard_grid:add_widget_at(volume_area, 6, 8, 1, 1)
dashboard_grid:add_widget_at(bluetooth_area, 8, 15, 1, 1)
dashboard_grid:add_widget_at(wifi_area, 4, 6, 1, 1)

-- Blurred dashboard
local dashboard = wibox {
    visible = false,
    ontop = true,
    width = helper.full_screen_width,
    height = helper.full_screen_height,
    y = 0,
    x = 0,
}

-- Blurred screen widget setup
dashboard:setup {
    widget = dashboard_grid,
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
    dashboard.toggle()
end)

return dashboard