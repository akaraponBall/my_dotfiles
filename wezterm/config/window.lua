-- ~/.config/wezterm/config/window.lua
local wezterm = require "wezterm"

return function(config)
    config.initial_cols = 120
    config.initial_rows = 28

    config.hide_tab_bar_if_only_one_tab = true

    config.window_frame = {
        font = wezterm.font("JetBrains Mono"),
        font_size = 10.0,
        active_titlebar_bg = "#2c2c2c",
        inactive_titlebar_bg = "#2c2c2c",
    }

    config.colors = {
        tab_bar = {
            inactive_tab_edge = "#575757",
        },
    }

    config.window_decorations = "RESIZE"
    config.window_background_opacity = 0.84
end
