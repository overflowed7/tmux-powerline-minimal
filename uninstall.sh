#!/usr/bin/env bash
set -euo pipefail

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

DST="$XDG_CONFIG_HOME/tmux-powerline"
ZSHRC="$HOME/.zshrc"

echo "[+] tmux-powerline-minimal uninstall"

if [ -d "$DST" ]; then
  echo "[+] removing: $DST"
  rm -rf "$DST"
fi

if [ -r "$ZSHRC" ]; then
  awk '
    /^# tmux-powerline-kp$/ { next }
    /^# tmux-powerline-clean$/ { next }
    /^# tmux-powerline-minimal$/ { next }
    /tmux-powerline\/kp\/tp\.zsh/ { next }
    /tmux-powerline\/core\/tp\.zsh/ { next }
    { print }
  ' "$ZSHRC" > "$ZSHRC.tmp"

  mv "$ZSHRC.tmp" "$ZSHRC"
  echo "[+] removed zsh loader from: $ZSHRC"
fi

echo "[+] uninstalled"
echo
echo "Next:"
echo "  source ~/.zshrc"
