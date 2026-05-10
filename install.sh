#!/usr/bin/env bash
set -euo pipefail

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DST="$XDG_CONFIG_HOME/tmux-powerline"
ZSHRC="$HOME/.zshrc"

PLUGIN_DIR="${TMUX_POWERLINE_PLUGIN_DIR:-$HOME/.tmux/plugins/tmux-powerline}"

echo "[+] tmux-powerline-minimal installer"

if [ ! -f "$REPO_DIR/config.sh" ] || [ ! -d "$REPO_DIR/core" ] || [ ! -d "$REPO_DIR/themes" ] || [ ! -d "$REPO_DIR/segments" ]; then
  echo "[!] invalid repo layout:"
  echo "    $REPO_DIR"
  echo
  echo "Expected:"
  echo "    config.sh"
  echo "    core/"
  echo "    themes/"
  echo "    segments/"
  exit 1
fi

if [ ! -d "$PLUGIN_DIR" ]; then
  echo "[!] warning: tmux-powerline plugin not found at:"
  echo "    $PLUGIN_DIR"
  echo
  echo "Install it with:"
  echo "    git clone https://github.com/erikw/tmux-powerline ~/.tmux/plugins/tmux-powerline"
  echo
  echo "Or set:"
  echo "    export TMUX_POWERLINE_PLUGIN_DIR=/path/to/tmux-powerline"
  echo
fi

mkdir -p "$DST"

echo "[+] installing to: $DST"

rm -rf "$DST/core" "$DST/themes" "$DST/segments"

cp -f "$REPO_DIR/config.sh" "$DST/config.sh"
cp -a "$REPO_DIR/core" "$DST/core"
cp -a "$REPO_DIR/themes" "$DST/themes"
cp -a "$REPO_DIR/segments" "$DST/segments"

chmod +x "$DST/segments"/*.sh 2>/dev/null || true

touch "$ZSHRC"

awk '
  /^# tmux-powerline-kp$/ { next }
  /^# tmux-powerline-clean$/ { next }
  /^# tmux-powerline-minimal$/ { next }
  /tmux-powerline\/kp\/tp\.zsh/ { next }
  /tmux-powerline\/core\/tp\.zsh/ { next }
  { print }
' "$ZSHRC" > "$ZSHRC.tmp"

mv "$ZSHRC.tmp" "$ZSHRC"

cat >> "$ZSHRC" <<'EOS'

# tmux-powerline-minimal
[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/core/tp.zsh" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/core/tp.zsh"
EOS

echo "[+] zsh loader installed in: $ZSHRC"

echo
echo "[+] installed"
echo
echo "Next:"
echo "  source ~/.zshrc"
echo "  tp -l"
echo "  tp darkvoid"
echo "  tp -t on"
echo "  tp -r"
