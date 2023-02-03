local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local xrdb = beautiful.xresources.get_current_theme()

function Xdpi(value)
    -- Setup was designed for a single monitor in dpi 192, however scaling became a nightmare when using two monitors.
    -- Then I reverted to dpi = 96, multiplying all giving inputs for 2
    -- TODO: instead of multiplying by 2 just change all calls for the double?
    return dpi(value * 2)
end

function Font(size, type)
    if type == nil then
        type = "Medium"
    end
    return "Iosevka Term " .. type .. " Font " .. size
end

Default_Font = "Iosevka Term Medium Font 14"
Bold_Font = "Iosevka Term Bold Font 14"

Dimensions = {
    gap = Xdpi(2),
    border = Xdpi(2),
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

Terminal = "alacritty"
Editor = "nvim"

Apps = {
    terminal = "alacritty",
    alternative_terminal = "urxvt",
    editor = "nvim",
    launcher = "rofi -theme base -modi drun -show drun",
    browser = "firefox",
    picture = "feh",
    file_manager = "nautilus",
    email = "thunderbird",
}
