local widgets = require("helpers.wibarwidgets")
local system = require("system.volume")

-- Volume
local volume = widgets.wibar_icon("")

awesome.connect_signal("signal::volume", function(vol, mute)
    vol = tonumber(vol)
    if mute or vol == 0 then
        volume.markup = widgets.recolor("󰸈", Color.red)
    else
        volume.markup = widgets.recolor("", Color.green)
    end
end)

volume:connect_signal("button::press", function()
    system.toggle_volume()
end)

volume:connect_signal("mouse::enter", function()
    volume.markup = widgets.recolor("", Color.fg)
end)

return volume
