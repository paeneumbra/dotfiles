local wibox = require("wibox")

-- TODO: WIP, some personalization stuffs

return wibox.widget({
    font = Font(45),
    align = "center",
    widget = wibox.widget.textbox,
    markup = "<span foreground='" .. Color.accent .. "'>󰣇󰰟󰯲󰰁󰰴</span>"
})