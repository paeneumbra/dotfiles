local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-- Clock
local clock = wibox.widget({
	widget = wibox.widget.textbox,
	font = Font,
})

local month_calendar = awful.widget.calendar_popup.month({
    position = "br",
})

gears.timer({
	timeout = 60,
	autostart = true,
	call_now = true,
	callback = function()
		clock.markup = os.date("%a %d/%m/%y | %H:%M ")
	end,
})

clock:connect_signal("button::press", function()
	month_calendar:toggle()
end)

return clock
