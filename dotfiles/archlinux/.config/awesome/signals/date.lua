local gears = require("gears")

local function get_date()
    awesome.emit_signal("signal::date", os.date("%a %d.%m.%y %H:%M"))
end

gears.timer({
    timeout = 60,
    autostart = true,
    call_now = true,
    callback = function()
        get_date()
    end,
})
