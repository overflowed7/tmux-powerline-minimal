#!/usr/bin/env bash
set -euo pipefail

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_DIR/tmux-powerline"
DST="$XDG_CONFIG_HOME/tmux-powerline"
ZSHRC="$HOME/.zshrc"

PLUGIN_DIR="${TMUX_POWERLINE_PLUGIN_DIR:-$HOME/.tmux/plugins/tmux-powerline}"

echo "[+] tmux-powerline-minimal installer"

if [ ! -d "$SRC" ]; then
  echo "[!] source directory not found:"
  echo "    $SRC"
  echo
  echo "Expected repo layout:"
  echo "    tmux-powerline-minimal/tmux-powerline/{config.sh,core,themes,segments}"
  exit 1
fi

if [ ! -d "$PLUGIN_DIR" ]; then
  echo "[!] tmux-powerline plugin not found:"
  echo "    $PLUGIN_DIR"
  echo
  echo "Install it first:"
  echo "    git clone https://github.com/erikw/tmux-powerline ~/.tmux/plugins/tmux-powerline"
  echo
  echo "Or set:"
  echo "    export TMUX_POWERLINE_PLUGIN_DIR=/path/to/tmux-powerline"
  exit 1
fi

mkdir -p "$DST"

echo "[+] installing to: $DST"

rm -rf "$DST/core" "$DST/themes" "$DST/segments"

cp -f "$SRC/config.sh" "$DST/config.sh"
cp -a "$SRC/core" "$DST/core"
cp -a "$SRC/themes" "$DST/themes"
cp -a "$SRC/segments" "$DST/segments"

chmod +x "$DST/segments"/*.sh 2>/dev/null || true

touch "$ZSHRC"

# Remove old loader lines / old labels.
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
EOF

chmod +x install.sh
uninstall.sh
cat > uninstall.sh <<'EOF'
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
