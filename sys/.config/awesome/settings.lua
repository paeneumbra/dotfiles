local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local xrdb = beautiful.xresources.get_current_theme()

function xdpi(number)
	return dpi(number)
end

Dimensions = {
	gap = dpi(2),
	border = dpi(2),
}

Color = {
	accent = xrdb.color4,
	bg = xrdb.background,
	fg = xrdb.foreground,
	black = xrdb.color0,
	red = xrdb.color1,
	green = xrdb.color2,
	yellow = xrdb.color3,
	blue = xrdb.color4,
	magenta = xrdb.color5,
	cyan = xrdb.color6,
	white = xrdb.color7,
	gray = xrdb.color8,
}

-- TODO: Use gears.filesystem.file_readable (filename) to check is wallpaper exists
-- if not, default, or send an error
Wallpaper = os.getenv("HOME") .. "/workspace/wallpapers/wallhaven-o3ew8p.png"

Font = "Iosevka Term Medium Font 8"
Bold_Font = "Iosevka Term Bold Font 8"
Large_Font = "Iosevka Term Bold Font 12"

Terminal = "alacritty"
Editor = "nvim"

Apps = {
	terminal = "alacritty",
	alternative_terminal = "wezterm",
	editor = "nvim",
	launcher = "rofi -theme base -modi drun -show drun",
	browser = "firefox",
	picture = "feh",
	file_manager = "nautilus",
	email = "thunderbird",
}
