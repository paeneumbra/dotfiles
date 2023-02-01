local wibox = require("wibox")
local widgets = require("interface.sidebar.helpers.widgets")

-- Calendar
local month_calendar = wibox.widget({
    date = os.date("*t"),
    font = Bold_Font,
    widget = wibox.widget.calendar.month,
})

return widgets.wrapping_widget(wibox.widget {
    month_calendar,
    spacing = xdpi(10),
    layout = wibox.layout.fixed.vertical,
})