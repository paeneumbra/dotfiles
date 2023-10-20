local widgets = require "helpers.dashboardwidgets"

-- close dashboard
local exit_button = widgets.dashboard_button "󰩈"
local exit_area = widgets.dashboard_box(exit_button)

exit_button:connect_signal("button::press", function()
    awesome.emit_signal "dashboard::toggle"
end)

exit_button:connect_signal("mouse::enter", function()
    exit_button.markup = widgets.recolor("󰩈", Color.fg)
end)

exit_button:connect_signal("mouse::leave", function()
    exit_button.markup = widgets.recolor("󰩈", Color.accent)
end)

return exit_area
