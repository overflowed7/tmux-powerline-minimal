# Minimal centralized tmux-powerline config.

export TMUX_POWERLINE_DEBUG_MODE_ENABLED="false"
export TMUX_POWERLINE_ERROR_LOGS_ENABLED="false"
export TMUX_POWERLINE_ERROR_LOGS_SCOPES=""

export TMUX_POWERLINE_PATCHED_FONT_IN_USE="true"

export TMUX_POWERLINE_DIR_USER_THEMES="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/themes"
export TMUX_POWERLINE_DIR_USER_SEGMENTS="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/segments"

[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/core/config.sh" ] \
  && . "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/core/config.sh"
