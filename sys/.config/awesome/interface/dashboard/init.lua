local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local calendar_widget = require("interface.dashboard.calendar")
local progressbar_widget = require("interface.dashboard.progressbars")
local sliders_widget = require("interface.dashboard.sliders")
local profile_widget = require("interface.dashboard.profile")
local awesome_widget = require("interface.dashboard.awesome")
local uptime_widget = require("interface.dashboard.uptime")


-- Screen of 2560x1440
full_screen_height = awful.screen.focused().geometry.height
full_screen_width = awful.screen.focused().geometry.width

-- Screen of 2560x1440 in a grid
dashboard_height = Xdpi(full_screen_height / 10)
dashboard_width = Xdpi(full_screen_width / 10)

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

local dashboard_layout = wibox.widget {
    --min_rows_size = dashboard_height,
    --min_cols_size = dashboard_width,
    layout = wibox.layout.grid,
}

-- (widget, row, col, row_span, col_span)
dashboard_layout:add_widget_at(awesome_area, 4, 7, 2, 5)
dashboard_layout:add_widget_at(profile_area, 6, 6, 2, 2)

dashboard_layout:add_widget_at(progressbar_area, 10, 12, 4, 5)
dashboard_layout:add_widget_at(sliders_area, 14, 9, 3, 5)

dashboard_layout:add_widget_at(calendar_area, 6, 8, 6, 3)
dashboard_layout:add_widget_at(uptime_area, 8, 11, 2, 2)

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