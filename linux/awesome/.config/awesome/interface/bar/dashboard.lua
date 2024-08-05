local widgets = require "helpers.wibarwidgets"

local dashboard = widgets.wibar_icon("󱓞", Color.green)

dashboard:connect_signal("button::press", function()
    awesome.emit_signal "dashboard::toggle"
end)

dashboard:connect_signal("mouse::enter", function()
    dashboard.markup = widgets.recolor("󱓟", Color.fg)
end)

dashboard:connect_signal("mouse::leave", function()
    dashboard.markup = widgets.recolor("󱓞", Color.green)
end)

return dashboard
