local wibox = require("wibox")

local widgets = require("helpers.dashboardwidgets")

-- buttons
local restart_area = widgets.full_button("󰜉")
local shutdown_area = widgets.full_button("󰐥")
local logoff_area = widgets.full_button("󰀒")
local close_awesome_area = widgets.full_button("󰆍")
local lock_area = widgets.full_button("󰌾")

-- TODO: Add actions (shudown/restart/lock/...)

local power_grid = wibox.widget {
    layout = wibox.layout.grid,
}

-- (widget, row, col, row_span, col_span)
power_grid:add_widget_at(restart_area, 5, 6, 1, 1)
power_grid:add_widget_at(shutdown_area, 5, 8, 1, 1)
power_grid:add_widget_at(logoff_area, 5, 10, 1, 1)
power_grid:add_widget_at(close_awesome_area, 5, 12, 1, 1)
power_grid:add_widget_at(lock_area, 5, 14, 1, 1)


-- Blurred dashboard
local power_menu = widgets.dashboard(power_grid)

awesome.connect_signal("power::toggle", function()
    power_menu.toggle()
end)

return power_menu