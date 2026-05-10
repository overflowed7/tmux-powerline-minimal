# shellcheck shell=bash

KP_THEME="${KP_THEME:-darkvoid}"

case "$KP_THEME" in
  clean)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#002b36"; KP_FG="#c0c0c0"; KP_ACCENT="#a6e22e"; KP_MUTED="#586e75"
    KP_A="#a6e22e"; KP_B="#005f87"; KP_C="#0087af"; KP_D="#5f00af"; KP_E="#00af87"; KP_F="#87005f"
    ;;

  blue)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="net"
    KP_BG="#00111a"; KP_FG="#d7ffff"; KP_ACCENT="#00afff"; KP_MUTED="#4f6f7f"
    KP_A="#00afff"; KP_B="#005f87"; KP_C="#0087af"; KP_D="#005faf"; KP_E="#00afaf"; KP_F="#005f87"
    ;;

  bluex)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="net"
    KP_BG="#020817"; KP_FG="#dff8ff"; KP_ACCENT="#00e5ff"; KP_MUTED="#4b6478"
    KP_A="#00e5ff"; KP_B="#0066ff"; KP_C="#00b7ff"; KP_D="#7c3cff"; KP_E="#00ffc8"; KP_F="#102a43"
    ;;

  amber)
    KP_SHAPE_DEFAULT="angle"; KP_LAYOUT="ops"
    KP_BG="#1c1400"; KP_FG="#ffd787"; KP_ACCENT="$KP_LOAD"; KP_MUTED="#8a6f2a"
    KP_A="$KP_LOAD"; KP_B="#5f3f00"; KP_C="#875f00"; KP_D="#ff5f00"; KP_E="#af8700"; KP_F="#5f3f00"
    ;;

  redline)
    KP_SHAPE_DEFAULT="block"; KP_LAYOUT="ops"
    KP_BG="#120008"; KP_FG="#ffd7df"; KP_ACCENT="#ff005f"; KP_MUTED="#7a4055"
    KP_A="#ff005f"; KP_B="#5f003f"; KP_C="#87005f"; KP_D="#af005f"; KP_E="#ff5f87"; KP_F="#5f003f"
    ;;

  ice)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#020b18"; KP_FG="#e8fbff"; KP_ACCENT="#00d7ff"; KP_MUTED="#5f7f8f"
    KP_A="#00d7ff"; KP_B="#005f87"; KP_C="#00afff"; KP_D="#5fafff"; KP_E="#87ffff"; KP_F="#003f5f"
    ;;

  darkvoid)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="pathleft"
    KP_BG="#0a0a0a"; KP_FG="#c8c8c8"; KP_ACCENT="#1bfd9c"; KP_MUTED="#505050"
    KP_A="#1bfd9c"; KP_B="#1c1c1c"; KP_C="#262626"; KP_D="#303030"; KP_E="#1bfd9c"; KP_F="#101010"
    ;;

  matrix)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#001100"; KP_FG="#caffca"; KP_ACCENT="#00ff87"; KP_MUTED="#3f6f3f"
    KP_A="#00ff87"; KP_B="#005f00"; KP_C="#00875f"; KP_D="#00af5f"; KP_E="#00ff87"; KP_F="#003f2f"
    ;;

  ember)
    KP_SHAPE_DEFAULT="block"; KP_LAYOUT="pathleft"
    KP_BG="#121212"; KP_FG="#e6e6e6"; KP_ACCENT="#ff8700"; KP_MUTED="#606060"
    KP_A="#ff8700"; KP_B="#262626"; KP_C="#303030"; KP_D="#5f3f00"; KP_E="$KP_LOAD"; KP_F="#1c1c1c"
    ;;

  scarlet)
    KP_SHAPE_DEFAULT="block"; KP_LAYOUT="ops"
    KP_BG="#111111"; KP_FG="#e6e6e6"; KP_ACCENT="#ff3030"; KP_MUTED="#5f5f5f"
    KP_A="#ff3030"; KP_B="#262626"; KP_C="#303030"; KP_D="#3a0000"; KP_E="#ff5f5f"; KP_F="#1c1c1c"
    ;;

  cyber)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="net"
    KP_BG="#090909"; KP_FG="#ffffd7"; KP_ACCENT="#ffff00"; KP_MUTED="#5f5f00"
    KP_A="#ffff00"; KP_B="#005f5f"; KP_C="#008787"; KP_D="#5f00af"; KP_E="#00d7af"; KP_F="#1c1c1c"
    ;;

  oxide)
    KP_SHAPE_DEFAULT="block"; KP_LAYOUT="pathleft"
    KP_BG="#18120f"; KP_FG="#e6d0c0"; KP_ACCENT="#d75f00"; KP_MUTED="#705040"
    KP_A="#d75f00"; KP_B="#3a2a20"; KP_C="#5f3f2f"; KP_D="#875f00"; KP_E="#d75f00"; KP_F="#241a15"
    ;;

  forest)
    KP_SHAPE_DEFAULT="angle"; KP_LAYOUT="std"
    KP_BG="#061208"; KP_FG="#d7ffd7"; KP_ACCENT="#8cff66"; KP_MUTED="#4f7f4f"
    KP_A="#8cff66"; KP_B="#1f3f20"; KP_C="#2f7f4f"; KP_D="#00af5f"; KP_E="#b6ff8a"; KP_F="#102615"
    ;;

  grape)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#16001f"; KP_FG="#e6d7ff"; KP_ACCENT="#af5fff"; KP_MUTED="#705090"
    KP_A="#af5fff"; KP_B="#5f00af"; KP_C="#5f5fff"; KP_D="#8700af"; KP_E="#d787ff"; KP_F="#3a005f"
    ;;

  solar)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#002b36"; KP_FG="#eee8d5"; KP_ACCENT="#b58900"; KP_MUTED="#586e75"
    KP_A="#b58900"; KP_B="#073642"; KP_C="#268bd2"; KP_D="#6c71c4"; KP_E="#859900"; KP_F="#073642"
    ;;

  dracula)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#282a36"; KP_FG="#f8f8f2"; KP_ACCENT="#bd93f9"; KP_MUTED="#6272a4"
    KP_A="#bd93f9"; KP_B="#44475a"; KP_C="#8be9fd"; KP_D="#ff79c6"; KP_E="#50fa7b"; KP_F="#44475a"
    ;;

  nord)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#2e3440"; KP_FG="#d8dee9"; KP_ACCENT="#88c0d0"; KP_MUTED="#4c566a"
    KP_A="#88c0d0"; KP_B="#3b4252"; KP_C="#5e81ac"; KP_D="#b48ead"; KP_E="#a3be8c"; KP_F="#3b4252"
    ;;

  tokyonight)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#1a1b26"; KP_FG="#c0caf5"; KP_ACCENT="#7aa2f7"; KP_MUTED="#565f89"
    KP_A="#7aa2f7"; KP_B="#24283b"; KP_C="#2ac3de"; KP_D="#bb9af7"; KP_E="#9ece6a"; KP_F="#414868"
    ;;

  solarized-osaka)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#001419"; KP_FG="#d7cbb2"; KP_ACCENT="#ffb454"; KP_MUTED="#5f6f6f"
    KP_A="#ffb454"; KP_B="#073642"; KP_C="#36c5f0"; KP_D="#7fbbb3"; KP_E="#9ece6a"; KP_F="#1f2d2e"
    ;;

  sonokai)
    KP_SHAPE_DEFAULT="angle"; KP_LAYOUT="std"
    KP_BG="#2c2e34"; KP_FG="#e2e2e3"; KP_ACCENT="#a7df78"; KP_MUTED="#7f8490"
    KP_A="#a7df78"; KP_B="#363944"; KP_C="#76cce0"; KP_D="#ab9df2"; KP_E="#e7c664"; KP_F="#3b3e48"
    ;;

  catppuccin)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="std"
    KP_BG="#1e1e2e"; KP_FG="#cdd6f4"; KP_ACCENT="#89b4fa"; KP_MUTED="#6c7086"
    KP_A="#89b4fa"; KP_B="#313244"; KP_C="#74c7ec"; KP_D="#cba6f7"; KP_E="#a6e3a1"; KP_F="#45475a"
    ;;

  monokai)
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="ops"
    KP_BG="#1e1f1c"; KP_FG="#f8f8f2"; KP_ACCENT="#a6e22e"; KP_MUTED="#75715e"
    KP_A="#a6e22e"; KP_B="#272822"; KP_C="#66d9ef"; KP_D="#f92672"; KP_E="#fd971f"; KP_F="#3e3d32"
    ;;

  *)
    KP_THEME="darkvoid"
    KP_SHAPE_DEFAULT="thin"; KP_LAYOUT="pathleft"
    KP_BG="#0a0a0a"; KP_FG="#c8c8c8"; KP_ACCENT="#1bfd9c"; KP_MUTED="#505050"
    KP_A="#1bfd9c"; KP_B="#1c1c1c"; KP_C="#262626"; KP_D="#303030"; KP_E="#1bfd9c"; KP_F="#101010"
    ;;
esac

KP_EFFECTIVE_SHAPE="${KP_SHAPE:-$KP_SHAPE_DEFAULT}"

case "$KP_EFFECTIVE_SHAPE" in
  auto|none) KP_EFFECTIVE_SHAPE="thin" ;;
esac

case "$KP_EFFECTIVE_SHAPE" in
  powerline)
    if tp_patched_font_in_use; then
      TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
      TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
      TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
      TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
    else
      TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="<"
      TMUX_POWERLINE_SEPARATOR_LEFT_THIN="<"
      TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=">"
      TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=">"
    fi
    ;;

  thin)
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
    ;;

  pipe)
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="│"
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN="│"
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="│"
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="│"
    ;;

  angle)
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="❮"
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN="‹"
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="❯"
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="›"
    ;;

  block)
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="▐"
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN="▐"
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▌"
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="▌"
    ;;

  none)
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
    ;;
esac

KP_BAR_BG="$KP_BG"
[ "${KP_TRANSPARENT:-0}" = "1" ] && KP_BAR_BG="default"

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-$KP_BAR_BG}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-$KP_FG}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
  "#[fg=${KP_BG},bg=${KP_ACCENT},bold]"
  "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
  " #I#F "
  "$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
  " #W "
  "#[fg=${KP_ACCENT},bg=${KP_BAR_BG},nobold]"
  "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
)

TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
  "fg=${KP_MUTED},bg=${KP_BAR_BG}"
)

TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
  "#[fg=${KP_MUTED},bg=${KP_BAR_BG}]"
  " #I#{?window_flags,#F, } "
  "$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
  " #W "
)

KP_LOAD="${KP_LOAD:-$KP_ACCENT}"

kp_left=()
kp_right=()

kp_l() { kp_left+=("$1 $2 $3"); }
kp_r() { kp_right+=("$1 $2 $3"); }

# Always keep left minimal core: session + current zsh vi mode.
kp_l "session_bold" "$KP_A" "$KP_BG"
kp_l "zvm_mode" "$KP_B" "$KP_FG"

if [ "${KP_LEFT_EXTRAS:-1}" = "0" ]; then
  kp_r "pwd" "$KP_F" "$KP_FG"
  kp_r "vcs_branch" "$KP_E" "$KP_BG"
  kp_r "load" "$KP_BG" "$KP_LOAD"
  kp_r "time" "$KP_BG" "$KP_ACCENT"
else
  case "$KP_LAYOUT" in
    std)
      kp_l "hostname" "$KP_B" "$KP_FG"
      kp_l "lan_ip" "$KP_C" "$KP_BG"
      kp_l "vpn" "$KP_D" "$KP_FG"

      kp_r "pwd" "$KP_F" "$KP_FG"
      kp_r "vcs_branch" "$KP_E" "$KP_BG"
      kp_r "load" "$KP_BG" "$KP_LOAD"
      kp_r "time" "$KP_BG" "$KP_ACCENT"
      ;;

    net)
      kp_l "hostname" "$KP_B" "$KP_FG"
      kp_l "lan_ip" "$KP_C" "$KP_BG"
      kp_l "vpn" "$KP_D" "$KP_FG"
      kp_l "wan_ip" "$KP_B" "$KP_FG"

      kp_r "pwd" "$KP_F" "$KP_FG"
      kp_r "vcs_branch" "$KP_E" "$KP_BG"
      kp_r "load" "$KP_BG" "$KP_LOAD"
      kp_r "utc_time" "$KP_BG" "$KP_C"
      kp_r "time" "$KP_BG" "$KP_ACCENT"
      ;;

    pathleft)
      kp_l "pwd" "$KP_F" "$KP_FG"

      kp_r "hostname" "$KP_B" "$KP_FG"
      kp_r "lan_ip" "$KP_C" "$KP_BG"
      kp_r "vpn" "$KP_D" "$KP_FG"
      kp_r "vcs_branch" "$KP_E" "$KP_BG"
      kp_r "load" "$KP_BG" "$KP_LOAD"
      kp_r "time" "$KP_BG" "$KP_ACCENT"
      ;;

    ops)
      kp_l "hostname" "$KP_B" "$KP_FG"
      kp_l "vpn" "$KP_D" "$KP_FG"
      kp_l "mode_indicator" "$KP_E" "$KP_BG"

      kp_r "pwd" "$KP_F" "$KP_FG"
      kp_r "vcs_branch" "$KP_E" "$KP_BG"
      kp_r "vcs_modified" "$KP_D" "$KP_FG"
      kp_r "load" "$KP_BG" "$KP_LOAD"
      kp_r "date" "$KP_B" "$KP_FG"
      kp_r "time" "$KP_BG" "$KP_ACCENT"
      ;;

    *)
      kp_l "hostname" "$KP_B" "$KP_FG"
      kp_l "lan_ip" "$KP_C" "$KP_BG"

      kp_r "pwd" "$KP_F" "$KP_FG"
      kp_r "vcs_branch" "$KP_E" "$KP_BG"
      kp_r "load" "$KP_BG" "$KP_LOAD"
      kp_r "time" "$KP_BG" "$KP_ACCENT"
      ;;
  esac
fi

TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=("${kp_left[@]}")
TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=("${kp_right[@]}")
