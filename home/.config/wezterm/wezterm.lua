local wezterm = require 'wezterm'

local fish_path = "/opt/homebrew/bin/fish"

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.default_prog = { fish_path, '-l' }
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

config.inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5
}

config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false

return config
