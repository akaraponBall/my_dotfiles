# Dotfiles

Personal configuration files for a small set of daily tools.

## Managed Programs

- `bash` via `bash_script/.bashrc` and `bash_script/.bash_aliases`
- `wezterm` via `wezterm/`
- `yazi` via `yazi/`
- `zed` via `zed/`

## Architecture

This repository mixes two patterns:

- Single-file home dotfiles for Bash
- App config directories for GUI and terminal tools under `~/.config`

### Layout

- `bash_script/.bashrc`
  Bash interactive shell startup. Based on the default Debian-style template, with local additions for prompt, completions, `nvm`, Cargo, `fzf`, and a `yazi` shell wrapper.
- `bash_script/.bash_aliases`
  Small command aliases for utility, Kubernetes, and Docker workflows.
- `wezterm/wezterm.lua`
  WezTerm entrypoint. Delegates to the modular config under `wezterm/config/`.
- `wezterm/config/init.lua`
  Composes the WezTerm config from focused modules.
- `wezterm/config/paths.lua`
  Sets the default working directory for new terminal windows and tabs.
- `wezterm/config/appearance.lua`
  Defines font fallback, font size, color scheme, and cursor behavior.
- `wezterm/config/window.lua`
  Controls initial window size, tab bar, frame styling, decorations, and opacity.
- `wezterm/config/keys.lua`
  Defines pane split and pane navigation shortcuts plus `Alt+1..8` tab activation.
- `yazi/yazi.toml`
  File manager behavior, preview sizing, and external openers.
- `zed/settings.json`
  Zed editor settings for theme, fonts, completions, and AI-related toggles.

## Install

The supported install path is the repository script:

```bash
./install.sh
```

The script creates these symlinks:

- `~/.bashrc` -> `bash_script/.bashrc`
- `~/.bash_aliases` -> `bash_script/.bash_aliases`
- `~/.config/wezterm` -> `wezterm/`
- `~/.config/yazi` -> `yazi/`
- `~/.config/zed` -> `zed/`

Behavior:

- Creates missing parent directories
- Leaves correct symlinks unchanged
- Refuses to overwrite existing non-symlink files or unrelated symlinks

If the script reports a conflict, move or back up the target path and rerun it.

## Manual Install

If you want to create the links yourself, use:

```bash
ln -s /home/ball/dotfiles/bash_script/.bashrc ~/.bashrc
ln -s /home/ball/dotfiles/bash_script/.bash_aliases ~/.bash_aliases
ln -s /home/ball/dotfiles/wezterm ~/.config/wezterm
ln -s /home/ball/dotfiles/yazi ~/.config/yazi
ln -s /home/ball/dotfiles/zed ~/.config/zed
```

## Notes

- Bash changes apply to new shell sessions after reloading `.bashrc`.
- WezTerm, Yazi, and Zed read directly from their linked config paths.
- `wezterm/` is the cleanest part of the repo structurally because it is already split by concern.
- This repo currently assumes Linux-style paths and tools.
