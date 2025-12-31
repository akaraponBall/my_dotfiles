-- ~/.config/wezterm/config/init.lua
local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- Import modules (each module is a function that mutates config)
require("config.paths")(config)
require("config.appearance")(config)
require("config.window")(config)
require("config.keys")(config)

return config
