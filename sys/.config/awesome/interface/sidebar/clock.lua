local wibox = require("wibox")

return wibox.widget({
    format = " %a %d/%m/%y 󰃰 %H:%M ",
    halign = "center",
    font = Bold_Font,
    widget = wibox.widget.textclock,
})