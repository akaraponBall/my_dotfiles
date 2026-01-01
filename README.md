# Dotfiles

Personal configuration files

## Layout

- `zed/` - Zed editor configuration directory.
- `wezterm/` - WezTerm configuration directory and modules.

## Zed

Zed reads settings from `~/.config/zed/settings.json`.

- `zed/settings.json` - Editor settings: fonts, theme, and basic completion/AI toggles.

## WezTerm

WezTerm reads its configuration from `~/.config/wezterm/wezterm.lua`.

- `wezterm/wezterm.lua` - Entry point that loads the modular config.
- `wezterm/config/init.lua` - Assembles the config by loading the modules below.
- `wezterm/config/paths.lua` - Default working directory for new terminals.
- `wezterm/config/appearance.lua` - Font, font size, color scheme, cursor style.
- `wezterm/config/window.lua` - Window sizing, tab bar behavior, frame colors, opacity.
- `wezterm/config/keys.lua` - Keybindings for pane splits, pane focus, and tab switching.

## How to use

Create symlinks so each app reads from this repo:

```bash
ln -s /home/ball/dotfiles/zed ~/.config/zed
ln -s /home/ball/dotfiles/wezterm ~/.config/wezterm
```

Then launch Zed and WezTerm normally. Changes in this repo will apply on next launch
(or after reload if the app supports it).
