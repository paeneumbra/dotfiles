local awful = require "awful"
local gears = require "gears"

local cmd_disk_usage_percentage = "df /dev/nvme0n1p2 | tail -1 | awk '{print $5}' | cut -c 1"

local function get_disk_space()
    awful.spawn.easy_async_with_shell(cmd_disk_usage_percentage, function(percentage)
        local used_percentage = tonumber(percentage)
        awesome.emit_signal("signal::disk", used_percentage)
    end)
end

gears.timer {
    timeout = 10000,
    call_now = true,
    autostart = true,
    callback = function()
        get_disk_space()
    end,
}
