-- ~/.config/wezterm/config/appearance.lua
local wezterm = require "wezterm"

return function(config)
    config.font = wezterm.font("JetBrains Mono")
    config.font_size = 14
    config.color_scheme = "Adventure"

    config.default_cursor_style = "BlinkingBlock"
    config.cursor_blink_rate = 600
end
