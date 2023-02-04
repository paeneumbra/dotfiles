local wibox = require("wibox")
local widgets = require("interface.helpers.widgets")

-- Calendar
local month_calendar = wibox.widget({
    date = os.date("*t"),
    halign = "center",
    font = Bold_Font,
    widget = wibox.widget.calendar.month,
})

-- Clock
local time = wibox.widget({
    format = "%H:%M",
    halign = "center",
    font = Font(50),
    widget = wibox.widget.textclock,
})

return widgets.wrapping_widget(wibox.widget {
    time,
    month_calendar,
    layout = wibox.layout.fixed.vertical,
})