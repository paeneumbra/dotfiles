local awful = require "awful"
local notify = require "helpers.notifications"

local print_screen = {}

local cmd_select_print_area = "maim --select -o -u > ~/Downloads/ps%s.png"

function print_screen.print_selected_area()
    date = os.date "%Y%m%d%H%M%S"
    awful.spawn.easy_async_with_shell(string.format(cmd_select_print_area, date), function()
        notify.normal "Printscreen: Image created in downloads folder"
    end)
end

return print_screen
