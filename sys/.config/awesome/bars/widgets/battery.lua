local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

-- Battery
local battery = wibox.widget({
	widget = wibox.widget.textbox,
	font = "Iosevka Nerd Font 14",
	markup = "  ",
})

local percentage = wibox.widget({
	widget = wibox.widget.textbox,
	font = "Iosevka Nerd Font 12",
})

local capacity

awesome.connect_signal("signal::battery", function(bat_zero, bat_one)
	-- Battery signals are not available after startup
	-- This validation avoids error messages
	if not bat_zero and not bat_one then
		capacity = 0
	else
        -- This adds both batteries resulting in values until 200%
		capacity = bat_zero + bat_one
	end

	if capacity < 40 then
		battery.markup = "<span foreground='" .. color.red .. "'>  </span>"
	else
		battery.markup = "<span foreground='" .. color.green .. "'>  </span>"
	end
	percentage.markup = capacity .. "%"
end)

return {
	battery,
	percentage,
	spacing = dpi(4),
	layout = wibox.layout.fixed.horizontal,
}
