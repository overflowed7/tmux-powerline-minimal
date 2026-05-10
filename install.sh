#!/usr/bin/env bash
set -euo pipefail

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TP="$XDG_CONFIG_HOME/tmux-powerline"
KP="$TP/kp"
THEMES="$TP/themes"
SEGS="$TP/segments"
BACKUP="$TP.bak.$(date +%Y%m%d-%H%M%S)"

echo "[+] tmux-powerline-kp installer"

if [ ! -d "$HOME/.tmux/plugins/tmux-powerline" ]; then
  echo "[!] tmux-powerline not found at:"
  echo "    $HOME/.tmux/plugins/tmux-powerline"
  echo
  echo "Install it first:"
  echo "    git clone https://github.com/erikw/tmux-powerline ~/.tmux/plugins/tmux-powerline"
  exit 1
fi

mkdir -p "$TP" "$KP" "$THEMES" "$SEGS"

if [ -d "$TP" ]; then
  cp -a "$TP" "$BACKUP"
  echo "[+] backup: $BACKUP"
fi

cp -a "$REPO_DIR/kp/." "$KP/"
cp -a "$REPO_DIR/themes/." "$THEMES/"
cp -a "$REPO_DIR/segments/." "$SEGS/"

chmod +x "$SEGS"/*.sh 2>/dev/null || true

cat > "$TP/config.sh" <<'EOS'
# Minimal centralized tmux-powerline config.

export TMUX_POWERLINE_DEBUG_MODE_ENABLED="false"
export TMUX_POWERLINE_ERROR_LOGS_ENABLED="false"
export TMUX_POWERLINE_ERROR_LOGS_SCOPES=""

export TMUX_POWERLINE_PATCHED_FONT_IN_USE="true"

export TMUX_POWERLINE_DIR_USER_THEMES="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/themes"
export TMUX_POWERLINE_DIR_USER_SEGMENTS="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/segments"

[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/kp/config.sh" ] \
  && . "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/kp/config.sh"
EOS

[ -r "$KP/current_theme" ] || printf '%s\n' darkvoid > "$KP/current_theme"

if [ ! -r "$KP/settings.sh" ]; then
  cat > "$KP/settings.sh" <<'EOS'
export KP_LEFT_EXTRAS="1"
export KP_SHAPE="thin"
export KP_TRANSPARENT="0"
EOS
fi

ZSHRC="$HOME/.zshrc"
LOADER='[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/kp/tp.zsh" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/kp/tp.zsh"'

touch "$ZSHRC"

if ! grep -Fq 'tmux-powerline/kp/tp.zsh' "$ZSHRC"; then
  {
    echo
    echo '# tmux-powerline-kp'
    echo "$LOADER"
  } >> "$ZSHRC"

  echo "[+] zsh loader added to $ZSHRC"
else
  echo "[=] zsh loader already present"
fi

echo "[+] installed"
echo
echo "Next:"
echo "  source ~/.zshrc"
echo "  tp -l"
echo "  tp darkvoid"
echo "  tp -t on"
echo "  tp -r"
