local naughty = require("naughty")

local _notification = {}

function _notification.normal(message)
    naughty.notification({
        title = "󰗖 Info:",
        message = message,
    })
end

function _notification.critical(message)
    naughty.notification({
        urgency = "critical",
        title = "󰀪 Error:",
        message = message,
    })
end

return _notification