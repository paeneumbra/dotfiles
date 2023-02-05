local awful = require("awful")

local _workspace = {}

local margin = Dimensions.border + Dimensions.useless_gap

function _workspace.workspace_height()
    -- https://awesomewm.org/apidoc/core_components/screen.html
    -- tilling area = 44 * 2, matches windows + border
    return awful.screen.focused().geometry.height - Xdpi(88) + Dimensions.border
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
