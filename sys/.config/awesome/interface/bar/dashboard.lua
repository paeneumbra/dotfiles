local widgets = require("helpers.widgets")

local dashboard = widgets.wibar_icon("󰕮", Color.green)

dashboard:connect_signal("button::press", function()
    awesome.emit_signal("dashboard::toggle")
end)

dashboard:connect_signal("mouse::enter", function()
    dashboard.markup = widgets.colored_markup("󰕮", Color.fg)
end)

dashboard:connect_signal("mouse::leave", function()
    dashboard.markup = widgets.colored_markup("󰕮", Color.green)
end)

return dashboard