local theme_assets = require("beautiful.theme_assets")

local gfs = require("gears.filesystem")
local gco = require("gears.color")
local assets = gfs.get_configuration_dir() .. "/theme/assets/round_button.png"
local default_theme = gfs.get_themes_dir()

local theme = {}

theme.wallpaper = Wallpaper
theme.font = Font

--TODO: There is some clash between definitions done here and in some other places, like in titlebar_close_button_focus
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

-- Menu:
-- New menu should be done, this one is rather convoluted
-- Also settings don't really work from current widgets
theme.menu_submenu_icon = default_theme .. "default/submenu.png"
theme.menu_height = xdpi(20)
theme.menu_width = xdpi(120)

theme.menu_border_width = xdpi(2)
theme.menu_border_color = Color.blue
theme.menu_fg_focus = Color.blue

--- Titlebars
theme.titlebar_close_button_normal = gco.recolor_image(assets, Color.red)
theme.titlebar_close_button_focus = gco.recolor_image(assets, Color.red)
theme.titlebar_close_button_normal_hover = gco.recolor_image(assets, Color.white)
theme.titlebar_close_button_focus_hover = gco.recolor_image(assets, Color.white)

theme.titlebar_maximized_button_normal_inactive = gco.recolor_image(assets, Color.yellow)
theme.titlebar_maximized_button_focus_inactive = gco.recolor_image(assets, Color.yellow)
theme.titlebar_maximized_button_normal_inactive_hover = gco.recolor_image(assets, Color.white)
theme.titlebar_maximized_button_focus_inactive_hover = gco.recolor_image(assets, Color.white)

theme.titlebar_maximized_button_normal_active = gco.recolor_image(assets, Color.yellow)
theme.titlebar_maximized_button_focus_active = gco.recolor_image(assets, Color.yellow)
theme.titlebar_maximized_button_normal_active_hover = gco.recolor_image(assets, Color.white)
theme.titlebar_maximized_button_focus_active_hover = gco.recolor_image(assets, Color.white)

theme.titlebar_minimize_button_normal = gco.recolor_image(assets, Color.green)
theme.titlebar_minimize_button_focus = gco.recolor_image(assets, Color.green)
theme.titlebar_minimize_button_normal_hover = gco.recolor_image(assets, Color.white)
theme.titlebar_minimize_button_focus_hover = gco.recolor_image(assets, Color.white)

theme.titlebar_sticky_button_normal_inactive = gco.recolor_image(assets, Color.cyan)
theme.titlebar_sticky_button_focus_inactive = gco.recolor_image(assets, Color.cyan)
theme.titlebar_sticky_button_normal_active = gco.recolor_image(assets, Color.white)
theme.titlebar_sticky_button_focus_active = gco.recolor_image(assets, Color.white)

-- You can use your own layout icons like this:
theme.layout_fairh = default_theme .. "default/layouts/fairhw.png"
theme.layout_fairv = default_theme .. "default/layouts/fairvw.png"
theme.layout_floating = default_theme .. "default/layouts/floatingw.png"
theme.layout_magnifier = default_theme .. "default/layouts/magnifierw.png"
theme.layout_max = default_theme .. "default/layouts/maxw.png"
theme.layout_fullscreen = default_theme .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = default_theme .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = default_theme .. "default/layouts/tileleftw.png"
theme.layout_tile = default_theme .. "default/layouts/tilew.png"
theme.layout_tiletop = default_theme .. "default/layouts/tiletopw.png"
theme.layout_spiral = default_theme .. "default/layouts/spiralw.png"
theme.layout_dwindle = default_theme .. "default/layouts/dwindlew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
