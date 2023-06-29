local gco = require("gears.color")

local _icons = {}

function _icons.recolor(icon_path, color)
    return gco.recolor_image(icon_path, color)
end

return _icons
