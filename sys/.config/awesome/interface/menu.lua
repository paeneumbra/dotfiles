local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local power_menu = {
    {
        "󰿅  Quit Awesome",
        function()
            awesome.quit()
        end,
    },
    {
        "󰐥  Poweroff",
        function()
            awful.spawn("poweroff", false)
        end,
    },
    {
        "󰜉  Reboot",
        function()
            awful.spawn("reboot", false)
        end,
    },
}

mainmenu = awful.menu({
    items = {
        { "󰑐  Refresh", awesome.restart },
        { "󰈹  Browser", Apps.browser },
        { "󰆍  Alacritty", Apps.terminal },
        { "󰆍  Urxvt", Apps.alternative_terminal },
        { "󰪶  File Manager", Apps.file_manager },
        { "󰍜  Applications",
          function()
              awful.spawn(Apps.launcher, false)
          end,
        },
        { "󰇰  Email",
          function()
              awful.spawn(Apps.email, false)
          end,
        },
        { "󰘥  Help",
          function()
              hotkeys_popup.show_help(nil, awful.screen.focused())
          end,
        },
        { "󰐦  Power Options", power_menu },
    },
})
