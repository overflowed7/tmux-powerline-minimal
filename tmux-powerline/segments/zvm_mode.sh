# shellcheck shell=bash

run_segment() {
  local base="${XDG_RUNTIME_DIR:-/tmp}"
  local pane="${TMUX_PANE:-global}"
  pane="${pane//[^a-zA-Z0-9_]/_}"

  local f1="$base/zvm-mode-${USER}-${pane}"
  local f2="$base/zvm-mode-${USER}"

  local mode
  mode="$(cat "$f1" 2>/dev/null || cat "$f2" 2>/dev/null || printf I)"

  case "$mode" in
    N) printf 'VI:N' ;;
    I) printf 'VI:I' ;;
    V) printf 'VI:V' ;;
    R) printf 'VI:R' ;;
    *) printf 'VI:%s' "$mode" ;;
  esac

  return 0
}
