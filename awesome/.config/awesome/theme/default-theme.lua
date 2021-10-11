--
-- jedn awesomerc
-- default-theme.lua
--

local gears = require("gears")
local beautiful = require("beautiful")

local filesystem = gears.filesystem
local dpi = beautiful.xresources.apply_dpi
local gtk_variable = beautiful.gtk.get_theme_variables

local theme_dir = filesystem.get_configuration_dir() .. "/theme"
local titlebar_theme = "stoplight"
local titlebar_icon_path = theme_dir .. "/icons/titlebar/" .. titlebar_theme .. "/"
local tip = titlebar_icon_path

-- Create theme table
local theme = {}

-- Font
theme.font = "Inter Regular 10"
theme.font_bold = "Inter Bold 10"

-- Menu icon theme
theme.icon_theme = "Papirus"

local awesome_overrides = function(theme)
  -- Theme directories
  theme.dir = theme_dir
  theme.icons = theme_dir .. "/icons/"

  -- Default wallpaper path
  theme.wallpaper = theme.dir .. "/wallpapers/ayu-wall.png"

  -- Default font
  theme.font = "Inter Regular 10"

  -- Foreground
  theme.fg_normal = "#e6e1cf"
  theme.fg_focus = "#e6e1cf"
  theme.fg_urgent = "#e6e1cf"

  -- Background
  theme.bg_normal = theme.background
  theme.bg_focus = "#0f1419"
  theme.bg_urgent = "#0f1419"

  -- System tray
  theme.bg_systray = theme.background
  theme.systray_icon_spacing = dpi(16)

  -- Decorations
  theme.useless_gap = dpi(10)
  theme.client_shape_rectange = gears.shape.rectangle
  theme.client_shape_rounded = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, dpi(6))
  end

  -- Borders
  theme.border_focus = theme.accent
  theme.border_normal = theme.system_white_dark
  theme.border_width = dpi(2)
  theme.border_radius = dpi(9)
end

return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
