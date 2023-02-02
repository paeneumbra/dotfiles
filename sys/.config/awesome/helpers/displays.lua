local awful = require("awful")
local naughty = require("naughty")

local _displays = {}

local cmd_dual_standard = "xrandr --output eDP1 --auto --output DP2 --auto --right-of eDP1"

local function send_notification(message)
    naughty.notification({
        title = "󰋼 Info:",
        message = message,
    })
end

function _displays.standard_dual_setup()
    send_notification("Setting standard dual monitor setup. Please standby...")
    awful.spawn(cmd_dual_standard, false)
end

return _displays