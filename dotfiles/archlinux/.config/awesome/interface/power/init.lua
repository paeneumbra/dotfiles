local awful = require "awful"
local wibox = require "wibox"

local widgets = require "helpers.dashboardwidgets"

-- commands
local restart = function()
    awful.spawn.with_shell "systemctl reboot"
end
local shutdown = function()
    awful.spawn.with_shell "systemctl poweroff"
end
local suspend = function()
    -- TODO: Lock and suspend?
    awesome.emit_signal "power::toggle"
    awful.spawn.with_shell "systemctl suspend"
end
local close_awesome = function()
    awesome.quit()
end

-- buttons
local restart_area = widgets.full_button("󰜉", restart)
local shutdown_area = widgets.full_button("󰐥", shutdown)
local suspend_are = widgets.full_button("󰒲", suspend)
local close_awesome_area = widgets.full_button("󰆍", close_awesome)
local lock_area = widgets.full_button "󰌾"

-- TODO: Add actions (shudown/restart/lock/...)

local power_grid = wibox.widget {
    layout = wibox.layout.grid,
}

-- (widget, row, col, row_span, col_span)
power_grid:add_widget_at(restart_area, 5, 6, 1, 1)
power_grid:add_widget_at(shutdown_area, 5, 8, 1, 1)
power_grid:add_widget_at(suspend_are, 5, 10, 1, 1)
power_grid:add_widget_at(close_awesome_area, 5, 12, 1, 1)
power_grid:add_widget_at(lock_area, 5, 14, 1, 1)

-- Blurred dashboard
local power_menu = widgets.dashboard(power_grid)

awesome.connect_signal("power::toggle", function()
    power_menu.toggle()
end)

return power_menu
