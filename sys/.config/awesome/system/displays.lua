local awful = require("awful")
local notify = require("helpers.notifications")

local displays = {}

local cmd_xrandr = [[ bash -c "xrandr -q --current | grep ' connected' | awk '{print $1}'"]]
local cmd_kill_display = "xrandr --output %s --off"
local cmd_intel_xrandr_dual = "xrandr --output eDP-1 --auto --output %s --auto --right-of eDP-1"
local cmd_nvidia_xrandr_dual = "xrandr --output eDP-1-1 --auto --output %s --auto --right-of eDP-1-1"
-- There are different handlers for intel(eg.eDP-1) or nvidia(eg-DP-1-1)
local external_connections = {
    "DP-1",
    "DP-1-1",
    "DP-2",
    "DP-1-2",
    "HDMI-1",
    "HDMI-1-1",
    "HDMI-2",
    "HDMI-1-2",
}

function displays.standard_dual_setup()
    notify.normal("Setting eDP-1 + DP-2 dual monitor setup.")
    awful.spawn(string.format(cmd_xrandr_dual, "DP-2"), function(stdout)
        notify.normal("Successful display update" .. stdout)
    end)
end

local function parse_async_output(output)
    local lines = {}
    for v in string.gmatch(output, "%S+") do
        notify.normal("Displays " .. v)
        table.insert(lines, v)
    end
    return lines
end

function displays.update_displays()
    awful.spawn.easy_async(cmd_xrandr, function(output)
        local lines = parse_async_output(output)

        if #lines == 1 then
            if (lines[1] == "eDP-1") or (lines[1] == "eDP-1-1") then
                notify.normal("Only " .. lines[1] .. "found, killing remainder displays")
                for _, i in pairs(external_connections) do
                    notify.normal("Killing all external displays")
                    awful.spawn.easy_async(string.format(cmd_kill_display, i))
                end
            else
                notify.critical("eDP-1 or eDP-1-1 is not connected - use arandr")
            end
        elseif #lines == 2 then
            if lines[1] == "eDP-1" then
                for _, v in pairs(lines) do
                    if v ~= "eDP-1" then
                        awful.spawn.easy_async(
                                string.format(cmd_intel_xrandr_dual, v),
                        -- Async sometimes gives a callback error is response is not handled properly
                                function(stdout)
                                    notify.normal("Successful display update" .. stdout)
                                end
                        )
                    end
                end
            elseif lines[1] == "eDP-1-1" then
                for _, v in pairs(lines) do
                    if v ~= "eDP-1-1" then
                        awful.spawn.easy_async(
                                string.format(cmd_nvidia_xrandr_dual, v),
                        -- Async sometimes gives a callback error is response is not handled properly
                                function(stdout)
                                    notify.normal("Successful display update" .. stdout)
                                end
                        )
                    end
                end
            end
        else
            notify.critical("eDP-1 or eDP-1-1 is not connected - use arandr")
        end
    end)
end

return displays
