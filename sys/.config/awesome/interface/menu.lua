local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local power_menu = {
    {
        "󰿅 Quit Awesome",
        function()
            awesome.quit()
        end,
    },
    {
        "󰐥 Poweroff",
        function()
            awful.spawn("poweroff", false)
        end,
    },
    {
        "󰜉 Reboot",
        function()
            awful.spawn("reboot", false)
        end,
    },
}

-- TODO: It's a global variable, needs refactoring
mainmenu = awful.menu({
    items = {
        { "󰑐 Refresh", awesome.restart },
        { "󰆍 Terminal", Apps.terminal },
        { "󰈹 Browser", Apps.browser },
        { "󰪶 File Manager", Apps.fileManager },
        { "󰍜 Applications",
          function()
              awful.spawn(Apps.launcher, false)
          end,
        },
        { "󰇰 Email",
          function()
              awful.spawn(Apps.email, false)
          end,
        },
        { "󰘥 Help",
          function()
              hotkeys_popup.show_help(nil, awful.screen.focused())
          end,
        },
        { "󰐦 Power Options", power_menu },
    },
})
