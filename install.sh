#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

links=(
  "$REPO_ROOT/zed:$CONFIG_HOME/zed"
  "$REPO_ROOT/wezterm:$CONFIG_HOME/wezterm"
  "$REPO_ROOT/yazi:$CONFIG_HOME/yazi"
  "$REPO_ROOT/bash_script/.bashrc:$HOME/.bashrc"
  "$REPO_ROOT/bash_script/.bash_aliases:$HOME/.bash_aliases"
)

link_path() {
  local source_path="$1"
  local target_path="$2"
  local target_dir

  target_dir="$(dirname "$target_path")"
  mkdir -p "$target_dir"

  if [ -L "$target_path" ]; then
    local current_target
    current_target="$(readlink "$target_path")"
    if [ "$current_target" = "$source_path" ]; then
      printf 'ok    %s -> %s\n' "$target_path" "$source_path"
      return
    fi

    printf 'skip  %s (existing symlink to %s)\n' "$target_path" "$current_target" >&2
    return 1
  fi

  if [ -e "$target_path" ]; then
    printf 'skip  %s (path exists and is not a symlink)\n' "$target_path" >&2
    return 1
  fi

  ln -s "$source_path" "$target_path"
  printf 'link  %s -> %s\n' "$target_path" "$source_path"
}

main() {
  local failed=0

  for entry in "${links[@]}"; do
    local source_path="${entry%%:*}"
    local target_path="${entry#*:}"

    if ! link_path "$source_path" "$target_path"; then
      failed=1
    fi
  done

  if [ "$failed" -ne 0 ]; then
    printf '\nSome targets were not changed. Move or back up the conflicting paths, then rerun.\n' >&2
    exit 1
  fi
}

main "$@"
