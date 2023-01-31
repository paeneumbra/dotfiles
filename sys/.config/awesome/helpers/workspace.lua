local awful = require("awful")

local _workspace = {}

local margin = Dimensions.border + Dimensions.gap

function _workspace.workspace_height()
    -- https://awesomewm.org/apidoc/core_components/screen.html
    -- tilling area = 44, matches windows + gap
    return awful.screen.focused().geometry.height - xdpi(44) + margin
end

function _workspace.workspace_width()
    return awful.screen.focused().workarea.width
end

function _workspace.workspace_x()
    return awful.screen.focused().workarea.x + margin
end
function _workspace.workspace_y()
    return awful.screen.focused().workarea.y + margin
end

return _workspace
