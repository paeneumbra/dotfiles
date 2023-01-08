local gears = require("gears")
local wibox = require("wibox")

-- Clock
local clock = wibox.widget.textbox()
clock.font = "Iosevka Nerd Medium Font 8"

gears.timer({
	timeout = 60,
	autostart = true,
	call_now = true,
	callback = function()
		clock.markup = os.date("%a %d:%m:%y | %H:%M ")
	end,
})

return clock
