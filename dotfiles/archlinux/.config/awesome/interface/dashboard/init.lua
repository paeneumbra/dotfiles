local wibox = require("wibox")

-- helpers
local widgets = require("helpers.dashboardwidgets")

-- widgets
local calendar_widget = require("interface.dashboard.calendar")
local progressbar_widget = require("interface.dashboard.progressbars")
local sliders_widget = require("interface.dashboard.sliders")
local profile_widget = require("interface.dashboard.profile")
local awesome_widget = require("interface.dashboard.awesome")
local uptime_widget = require("interface.dashboard.uptime")

-- boxes
local bluetooth_area = require("interface.dashboard.bluetoothbutton")
local display_area = require("interface.dashboard.displaybutton")
local close_dashboard_area = require("interface.dashboard.closedashboardbutton")
local volume_area = require("interface.dashboard.volumebutton")
local wifi_area = require("interface.dashboard.wifibutton")

local awesome_area = widgets.dashboard_box(awesome_widget)
local calendar_area = widgets.dashboard_box(calendar_widget)
local progressbar_area = widgets.dashboard_box(progressbar_widget)
local sliders_area = widgets.dashboard_box(sliders_widget)
local profile_area = widgets.dashboard_box(profile_widget)
local uptime_area = widgets.dashboard_box(uptime_widget)

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
dashboard_grid:add_widget_at(bluetooth_area, 9, 15, 1, 1)
dashboard_grid:add_widget_at(wifi_area, 4, 6, 1, 1)
dashboard_grid:add_widget_at(display_area, 7, 17, 1, 1)
dashboard_grid:add_widget_at(close_dashboard_area, 10, 20, 1, 1)

-- Blurred dashboard
local dashboard = widgets.dashboard(dashboard_grid)

awesome.connect_signal("dashboard::toggle", function()
    dashboard.toggle()
end)

return dashboard
