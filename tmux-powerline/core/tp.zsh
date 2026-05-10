# tmux-powerline theme switcher

typeset -ga KP_TMUX_POWERLINE_THEMES=(
  clean blue bluex amber redline
  ice darkvoid matrix ember scarlet
  cyber oxide forest grape
  solar dracula nord tokyonight solarized-osaka
  sonokai catppuccin monokai
)

typeset -ga KP_TMUX_POWERLINE_SHAPES=(
  thin pipe angle block
)

_tp_kp_dir() {
  printf '%s\n' "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/core"
}

_tp_current_file() {
  printf '%s\n' "$(_tp_kp_dir)/current_theme"
}

_tp_settings_file() {
  printf '%s\n' "$(_tp_kp_dir)/settings.sh"
}

_tp_plugin() {
  printf '%s\n' "$HOME/.tmux/plugins/tmux-powerline/main.tmux"
}

_tp_reload() {
  local plugin="$(_tp_plugin)"

  if [[ -n "$TMUX" ]]; then
    tmux run-shell "$plugin" 2>/dev/null
    tmux refresh-client -S 2>/dev/null
  fi
}

_tp_valid_theme() {
  local t
  for t in "${KP_TMUX_POWERLINE_THEMES[@]}"; do
    [[ "$t" == "$1" ]] && return 0
  done
  return 1
}

_tp_valid_shape() {
  local s
  for s in "${KP_TMUX_POWERLINE_SHAPES[@]}"; do
    [[ "$s" == "$1" ]] && return 0
  done
  return 1
}

_tp_set_kv() {
  local k="$1"
  local v="$2"
  local f="$(_tp_settings_file)"

  mkdir -p "${f:h}"
  touch "$f"

  if grep -q "^export ${k}=" "$f"; then
    perl -0pi -e "s/^export ${k}=\"[^\"]*\"/export ${k}=\"$v\"/m" "$f"
  else
    printf 'export %s="%s"\n' "$k" "$v" >> "$f"
  fi
}

tp() {
  local usage='usage:
  tp -l                  list themes
  tp -c                  show current theme
  tp -o                  show options
  tp -r                  reload
  tp -S                  list shapes
  tp -s <shape>          set shape: thin|pipe|angle|block
  tp -t <on|off>         transparency for gaps/base status
  tp -x <on|off>         left extras: hostname/ip/vpn
  tp <theme>             switch theme'

  case "$1" in
    -l|--list)
      local cur
      cur="$(cat "$(_tp_current_file)" 2>/dev/null || printf darkvoid)"
      local t
      for t in "${KP_TMUX_POWERLINE_THEMES[@]}"; do
        if [[ "$t" == "$cur" ]]; then
          printf '* %s\n' "$t"
        else
          printf '  %s\n' "$t"
        fi
      done
      ;;

    -S|--shapes)
      printf '%s\n' "${KP_TMUX_POWERLINE_SHAPES[@]}"
      ;;

    -c|--current)
      cat "$(_tp_current_file)" 2>/dev/null || printf 'darkvoid\n'
      ;;

    -o|--options)
      local f="$(_tp_settings_file)"
      echo "theme=$(cat "$(_tp_current_file)" 2>/dev/null || printf darkvoid)"
      if [[ -r "$f" ]]; then
        grep -E '^export KP_' "$f" | sed 's/^export //; s/"//g'
      fi
      ;;

    -r|--reload)
      _tp_reload
      ;;

    -s|--shape)
      [[ -z "$2" ]] && { echo "$usage"; return 1; }
      _tp_valid_shape "$2" || { echo "unknown shape: $2"; return 1; }
      _tp_set_kv KP_SHAPE "$2"
      _tp_reload
      echo "shape: $2"
      ;;

    -t|--transparent)
      case "$2" in
        on)  _tp_set_kv KP_TRANSPARENT 1 ;;
        off) _tp_set_kv KP_TRANSPARENT 0 ;;
        *) echo "usage: tp -t on|off"; return 1 ;;
      esac
      _tp_reload
      echo "transparent: $2"
      ;;

    -x|--extras)
      case "$2" in
        on)  _tp_set_kv KP_LEFT_EXTRAS 1 ;;
        off) _tp_set_kv KP_LEFT_EXTRAS 0 ;;
        *) echo "usage: tp -x on|off"; return 1 ;;
      esac
      _tp_reload
      echo "left extras: $2"
      ;;

    -h|--help|'')
      echo "$usage"
      ;;

    *)
      local wanted="$1"
      local current_file="$(_tp_current_file)"
      local theme_dir="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/themes"

      _tp_valid_theme "$wanted" || {
        echo "unknown theme: $wanted"
        echo
        echo "$usage"
        return 1
      }

      [[ -r "$theme_dir/$wanted.sh" ]] || {
        echo "missing theme wrapper: $theme_dir/$wanted.sh"
        return 1
      }

      printf '%s\n' "$wanted" > "$current_file"
      _tp_reload
      echo "tmux-powerline theme: $wanted"
      ;;
  esac
}

_tp() {
  local -a states
  states=(on off)

  _arguments \
    '(-l --list)'{-l,--list}'[list themes]' \
    '(-c --current)'{-c,--current}'[show current theme]' \
    '(-o --options)'{-o,--options}'[show current options]' \
    '(-r --reload)'{-r,--reload}'[reload tmux-powerline]' \
    '(-S --shapes)'{-S,--shapes}'[list shapes]' \
    '(-s --shape)'{-s,--shape}'[set shape]:shape:($KP_TMUX_POWERLINE_SHAPES)' \
    '(-t --transparent)'{-t,--transparent}'[toggle transparency]:state:(on off)' \
    '(-x --extras)'{-x,--extras}'[toggle left extras]:state:(on off)' \
    '1:theme:($KP_TMUX_POWERLINE_THEMES)'
}

(( $+functions[compdef] )) && compdef _tp tp

_kp_write_zvm_mode() {
  local mode="$1"
  local base="${XDG_RUNTIME_DIR:-/tmp}"
  local pane="${TMUX_PANE:-global}"
  pane="${pane//[^a-zA-Z0-9_]/_}"

  print -r -- "$mode" > "$base/zvm-mode-${USER}" 2>/dev/null
  print -r -- "$mode" > "$base/zvm-mode-${USER}-${pane}" 2>/dev/null
}

_kp_write_zvm_mode I

if [[ -o interactive ]]; then
  if (( ! ${+functions[_kp_original_zvm_after_select_vi_mode]} )); then
    if (( ${+functions[zvm_after_select_vi_mode]} )); then
      functions[_kp_original_zvm_after_select_vi_mode]=$functions[zvm_after_select_vi_mode]
    fi

    zvm_after_select_vi_mode() {
      (( ${+functions[_kp_original_zvm_after_select_vi_mode]} )) \
        && _kp_original_zvm_after_select_vi_mode "$@"

      case "${ZVM_MODE:-}" in
        *NORMAL*|normal|vicmd) _kp_write_zvm_mode N ;;
        *VISUAL*|visual*)      _kp_write_zvm_mode V ;;
        *REPLACE*|replace*)    _kp_write_zvm_mode R ;;
        *INSERT*|insert*|'')   _kp_write_zvm_mode I ;;
        *)                     _kp_write_zvm_mode I ;;
      esac
    }
  fi
fi
