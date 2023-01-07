local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-- Wifi
local wifi = wibox.widget.textbox()
wifi.font = "Iosevka Nerd Font 14"

local function get_wifi()
	local script = "nmcli g | tail -1 | awk '{printf $1}'"

	awful.spawn.easy_async_with_shell(script, function(stdout)
		local status = tostring(stdout)
		if not status:match("disconnected") then
			local get_strength = "awk '/^s*w/ { print  int($3 * 100 / 70) }' /proc/net/wireless"

			awful.spawn.easy_async_with_shell(get_strength, function(stdout)
				local strength

				-- This validation avoids nil errors when connection is down
				if not stdout then
					strength = 0
				else
					strength = tonumber(stdout)
				end

				if strength < 30 then
					wifi.markup = "<span foreground='" .. color.red .. "'>  </span>"
				else
					wifi.markup = "<span foreground='" .. color.green .. "'>  </span>"
				end
			end)
		else
			wifi.markup = "<span foreground='" .. color.red .. "'>  </span>"
		end
	end)
end

gears.timer({
	timeout = 10,
	autostart = true,
	call_now = true,
	callback = function()
		get_wifi()
	end,
})

return wifi
