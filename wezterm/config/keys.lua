-- ~/.config/wezterm/config/keys.lua
local wezterm = require "wezterm"
local act = wezterm.action

return function(config)
    config.keys = {
        -- Split panes (SHIFT + ALT + Arrow)
        {
            key = "RightArrow",
            mods = "SHIFT|ALT",
            action = act.SplitPane { direction = "Right", size = { Percent = 50 } },
        },
        {
            key = "LeftArrow",
            mods = "SHIFT|ALT",
            action = act.SplitPane { direction = "Left", size = { Percent = 50 } },
        },
        {
            key = "UpArrow",
            mods = "SHIFT|ALT",
            action = act.SplitPane { direction = "Up", size = { Percent = 50 } },
        },
        {
            key = "DownArrow",
            mods = "SHIFT|ALT",
            action = act.SplitPane { direction = "Down", size = { Percent = 50 } },
        },

        -- Activate pane (ALT + Arrow)
        { key = "LeftArrow",  mods = "ALT", action = act.ActivatePaneDirection "Left" },
        { key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection "Right" },
        { key = "UpArrow",    mods = "ALT", action = act.ActivatePaneDirection "Up" },
        { key = "DownArrow",  mods = "ALT", action = act.ActivatePaneDirection "Down" },
    }

    -- ALT + number to activate that tab (1..8)
    for i = 1, 8 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = "ALT",
            action = act.ActivateTab(i - 1),
        })
    end
end
