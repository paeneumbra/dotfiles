local widgets = require("helpers.widgets")

-- Date
local date = widgets.wibar_text()

awesome.connect_signal("signal::date", function(stdout)
    date.markup = widgets.colored_markup(stdout, Color.fg)
end)

return date
