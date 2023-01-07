local awful = require("awful")
local gears = require("gears")

local vol_sc = "wpctl get-volume @DEFAULT_AUDIO_SINK@"

local function get_vol()
	awful.spawn.easy_async_with_shell(vol_sc, function(vol)
		if string.find(vol, "MUTED") then
			muted = true
		else
			muted = false
		end

		awesome.emit_signal("signal::volume", vol, muted)
	end)
end

gears.timer({
	timeout = 2,
	call_now = true,
	autostart = true,
	callback = function()
		get_vol()
	end,
})
