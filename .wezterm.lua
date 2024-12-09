local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("MonoLisa Nerd Font Mono", { weight = "Bold", stretch = "SemiExpanded" })
config.font_size = 20

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "catppuccin-mocha"
config.automatically_reload_config = true
config.line_height = 2
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9

return config
