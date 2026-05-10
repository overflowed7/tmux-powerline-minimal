#!/usr/bin/env bash
set -euo pipefail

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

TP="$XDG_CONFIG_HOME/tmux-powerline"
BACKUP="$TP.removed.$(date +%Y%m%d-%H%M%S)"
ZSHRC="$HOME/.zshrc"

echo "[+] tmux-powerline-kp uninstall"

if [ -d "$TP" ]; then
  mv "$TP" "$BACKUP"
  echo "[+] moved config to: $BACKUP"
fi

if [ -r "$ZSHRC" ]; then
  cp "$ZSHRC" "$ZSHRC.bak.$(date +%Y%m%d-%H%M%S)"

  awk '
    /# tmux-powerline-kp/ { skip=1; next }
    skip && /tmux-powerline\/kp\/tp.zsh/ { skip=0; next }
    !skip { print }
  ' "$ZSHRC" > "$ZSHRC.tmp"

  mv "$ZSHRC.tmp" "$ZSHRC"
  echo "[+] removed zsh loader from $ZSHRC"
fi

echo "[+] uninstalled"
