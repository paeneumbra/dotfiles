local theme_assets = require("beautiful.theme_assets")
local gfs = require("gears.filesystem")

local helper = require("helpers.icons")
local assets = gfs.get_configuration_dir() .. "/theme/assets/"
local button_icon = assets .. "round_button.png"

local theme = {}

theme.wallpaper = Wallpaper
theme.font = Default_Font

-- take a look and normalize it
theme.bg_normal = Color.bg
theme.bg_focus = Color.blue
theme.bg_urgent = Color.red
theme.bg_minimize = Color.yellow
theme.bg_systray = theme.bg_normal

theme.fg_normal = Color.fg
theme.fg_focus = Color.cyan
theme.fg_urgent = Color.magenta
theme.fg_minimize = Color.yellow

theme.useless_gap = Dimensions.gap
theme.border_width = Dimensions.border
theme.border_normal = Color.bg
theme.border_focus = Color.bg
theme.border_marked = Color.white

-- Menu
theme.menu_submenu_icon = helper.recolor(assets .. "submenu.svg", Color.accent)
theme.menu_height = Xdpi(20)
theme.menu_width = Xdpi(150)
theme.menu_border_width = Xdpi(2)
theme.menu_border_color = Color.accent
theme.menu_fg_focus = Color.bg
theme.menu_bg_focus = Color.accent

--- Titlebars
theme.titlebar_close_button_normal = helper.recolor(button_icon, Color.red)
theme.titlebar_close_button_focus = helper.recolor(button_icon, Color.red)
theme.titlebar_close_button_normal_hover = helper.recolor(button_icon, Color.white)
theme.titlebar_close_button_focus_hover = helper.recolor(button_icon, Color.white)

theme.titlebar_maximized_button_normal_inactive = helper.recolor(button_icon, Color.yellow)
theme.titlebar_maximized_button_focus_inactive = helper.recolor(button_icon, Color.yellow)
theme.titlebar_maximized_button_normal_inactive_hover = helper.recolor(button_icon, Color.white)
theme.titlebar_maximized_button_focus_inactive_hover = helper.recolor(button_icon, Color.white)

theme.titlebar_maximized_button_normal_active = helper.recolor(button_icon, Color.yellow)
theme.titlebar_maximized_button_focus_active = helper.recolor(button_icon, Color.yellow)
theme.titlebar_maximized_button_normal_active_hover = helper.recolor(button_icon, Color.white)
theme.titlebar_maximized_button_focus_active_hover = helper.recolor(button_icon, Color.white)

theme.titlebar_minimize_button_normal = helper.recolor(button_icon, Color.green)
theme.titlebar_minimize_button_focus = helper.recolor(button_icon, Color.green)
theme.titlebar_minimize_button_normal_hover = helper.recolor(button_icon, Color.white)
theme.titlebar_minimize_button_focus_hover = helper.recolor(button_icon, Color.white)

theme.titlebar_sticky_button_normal_inactive = helper.recolor(button_icon, Color.cyan)
theme.titlebar_sticky_button_focus_inactive = helper.recolor(button_icon, Color.cyan)
theme.titlebar_sticky_button_normal_active = helper.recolor(button_icon, Color.white)
theme.titlebar_sticky_button_focus_active = helper.recolor(button_icon, Color.white)

-- You can use your own layout icons like this:
theme.layout_floating = helper.recolor(assets .. "floating.png", Color.accent)
theme.layout_tile = helper.recolor(assets .. "tile.png", Color.accent)
theme.layout_dwindle = helper.recolor(assets .. "dwindle.png", Color.accent)

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
theme.profile_picture = assets .. "awesome.svg"
return theme
