local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

local mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

-- Volume
local volume = wibox.widget({
	widget = wibox.widget.textbox,
	font = "Iosevka Nerd Font 14",
	markup = "  ",
})

awesome.connect_signal("signal::volume", function(vol, mute)
	vol = tonumber(vol)
	if mute or vol == 0 then
		volume.markup = "<span foreground='" .. color.red .. "'>  </span>"
	else
		volume.markup = "<span foreground='" .. color.green .. "'>  </span>"
	end
end)

volume:connect_signal("button::press", function()
	awful.spawn.easy_async_with_shell(mute, function()
		naughty.notification({
			urgency = "normal",
			title = "You muted/unmuted!",
		})
	end)
end)

return {
	volume,
	spacing = dpi(4),
	layout = wibox.layout.fixed.horizontal,
}
