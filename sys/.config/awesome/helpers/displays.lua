local awful = require("awful")
local notify = require("helpers.notifications")

local _displays = {}

local cmd_xrandr = [[ bash -c "xrandr -q --current | grep ' connected' | awk '{print $1}'"]]
local cmd_kill_display = "xrandr --output %s --off"
local cmd_xrandr_dual = "xrandr --output eDP1 --auto --output %s --auto --right-of eDP1"
local external_connections = {
    "DP1",
    "DP2",
    "HDMI1",
    "HDMI2",
}

function _displays.standard_dual_setup()
    notify.normal("Setting eDP1 + DP2 dual monitor setup.")
    awful.spawn(string.format(cmd_xrandr_dual, "DP2"), function(stdout)
        notify.normal("Successful display update" .. stdout)
    end)
end

local function parse_async_output(output)
    lines = {}
    for v in string.gmatch(output, "%S+") do
        table.insert(lines, v)
    end
    return lines
end

function _displays.update_displays()
    awful.spawn.easy_async(cmd_xrandr, function(output)

        lines = parse_async_output(output)

        if #lines == 1 then
            if lines[1] == "eDP1" then
                notify.normal("Only eDP1 found, killing remainder displays")
                for _, i in pairs(external_connections) do
                    notify.normal("Killing all external displays")
                    awful.spawn.easy_async(string.format(cmd_kill_display, i))
                end
            else
                notify.critical("eDP1 is not connected - use arandr")
            end
        elseif #lines == 2 then
            for _, v in pairs(lines) do
                if v ~= "eDP1" then
                    notify.normal(string.format("Command: " .. cmd_xrandr_dual, v))
                    awful.spawn.easy_async(string.format(cmd_xrandr_dual, v),
                    -- Async sometimes gives a callback error is response is not handled properly
                            function(stdout)
                                notify.normal("Successful display update" .. stdout)
                            end)
                end
            end
        else
            notify.critical("eDP1 is not connected - use arandr")
        end
    end)
end

return _displays