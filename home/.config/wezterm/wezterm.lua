local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'
config.default_prog = { "/opt/homebrew/bin/fish", '-l' }
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"
config.window_background_opacity = 0.99
config.use_fancy_tab_bar = true
config.status_update_interval = 1000
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 14

config.inactive_pane_hsb = {
    saturation = 0.5,
    brightness = 0.7
}

config.keys = {
    {
        key = 'd',
        mods = 'SUPER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'd',
        mods = 'SUPER|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'w',
        mods = 'SUPER',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        key = 's',
        mods = 'SUPER',
        action = act.PaneSelect
    },
    {
        key = 'LeftArrow',
        mods = 'SUPER|SHIFT',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'SUPER|SHIFT',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'SUPER|SHIFT',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'SUPER|SHIFT',
        action = act.ActivatePaneDirection 'Down',
    },
}



wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

return config
