local awful = require "awful"

local _run = {}

function _run.start_if_not_running(command, callback)
    awful.spawn.easy_async_with_shell(string.format("ps aux | grep '%s' | grep -v 'grep'", command), function(stdout)
        if stdout == "" or stdout == nil then
            callback()
        end
    end)
end

function _run.restart(command)
    awful.spawn.easy_async_with_shell(string.format("pkill '%s'", command), function()
        awful.spawn.with_shell(string.format("sleep 5;  %s", command), false)
    end)
end

function _run.sleep(value)
    awful.spawn.easy_async_with_shell(string.format("sleep %s", value), false)
end

return _run
