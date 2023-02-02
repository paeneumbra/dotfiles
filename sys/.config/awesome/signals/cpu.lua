local awful = require("awful")
local gears = require("gears")

local cmd_cpu_temperature = "sensors | grep 'CPU' | awk '{printf $2}' | cut -c 2-5 | cut -d '.' -f -1"

local function cpu_temperature()
	awful.spawn.easy_async_with_shell(cmd_cpu_temperature, function(stdout)
		temperature = tonumber(stdout)
		awesome.emit_signal("signal::cpu", temperature)
	end)
end

gears.timer({
	timeout = 10,
	call_now = true,
	autostart = true,
	callback = function()
		cpu_temperature()
	end,
})
