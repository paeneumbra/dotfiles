local widgets = require("helpers.widgets")
local helper = require("helpers.volume")

-- Volume
local volume = widgets.wibar_icon(default_markup)

awesome.connect_signal("signal::volume", function(vol, mute)
    vol = tonumber(vol)
    if mute or vol == 0 then
        volume.markup = widgets.colored_markup("󰖁", Color.red)
    else
        volume.markup = widgets.colored_markup("󰕾", Color.green)
    end
end)

volume:connect_signal("button::press", function()
    helper.toggle_volume()
end)

volume:connect_signal("mouse::enter", function()
    volume.markup = widgets.colored_markup("󰕾", Color.fg)
end)

return volume
