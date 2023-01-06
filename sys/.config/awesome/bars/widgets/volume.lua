local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

--TODO: Volume {{signal::volume}} is a function - needs a lib to call it
-- Volume
local volume = wibox.widget.textbox()
volume.font = "Iosevka Nerd Font 18"

local percentage = wibox.widget.textbox()
percentage.font = "Iosevka Nerd Font 14"

awesome.connect_signal("signal::volume", function(vol, mute)
	vol = tonumber(vol)
	if mute or vol == 0 then
		volume.markup = "<span foreground='" .. color.white .. "'></span>"
		percentage.markup = "Muted"
	else
		if vol < 60 then
			volume.markup = "<span foreground='" .. color.yellow .. "'></span>"
			percentage.markup = vol .. "%"
		else
			volume.markup = "<span foreground='" .. color.red .. "'></span>"
			percentage.markup = vol .. "%"
		end
	end
end)

return {
	volume,
	--percentage,
	spacing = dpi(4),
	layout = wibox.layout.fixed.horizontal,
}
