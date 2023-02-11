local widgets = require("helpers.dashboardwidgets")
local system = require("system.displays")

-- Displays
local display_button = widgets.dashboard_button("󱡶")
local display_area = widgets.dashboard_box(display_button)

display_button:connect_signal("button::press", function()
    system.update_displays()
end)

display_button:connect_signal("mouse::enter", function()
    display_button.markup = widgets.recolor("󱡶", Color.fg)
end)

display_button:connect_signal("mouse::leave", function()
    display_button.markup = widgets.recolor("󱡶", Color.accent)
end)

return display_area
