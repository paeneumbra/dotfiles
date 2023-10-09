local widgets = require("helpers.wibarwidgets")

-- Date
local date = widgets.wibar_text()

awesome.connect_signal("signal::date", function(stdout)
    date.markup = widgets.recolor(stdout, Color.fg)
end)

return date
