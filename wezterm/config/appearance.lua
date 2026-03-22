-- ~/.config/wezterm/config/appearance.lua
local wezterm = require "wezterm"

return function(config)
    config.font = wezterm.font_with_fallback({
        "Ubuntu Sans Mono",
        "Noto Sans Mono",
        "JetBrains Mono",
    })
    config.font_size = 16
    config.color_scheme = "Adventure"

    config.default_cursor_style = "BlinkingBlock"
    config.cursor_blink_rate = 600
end
