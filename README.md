# tmux-powerline-minimal

A minimal and clean theme manager for [`tmux-powerline`](https://github.com/erikw/tmux-powerline).

`tmux-powerline-minimal` adds a small `tp` command to switch themes, toggle transparency, change separator shapes, and keep the tmux status bar readable without manually editing tmux configuration files.

---

## Features

- Live theme switching with `tp`
- Clean dark themes
- Transparent status background option
- Separator shape switching
- Optional left-side extras
- Zsh completion
- Bold tmux session display
- Optional zsh vi-mode status display
- Compact file layout under `~/.config/tmux-powerline`

---

## Requirements

Required:

- `tmux`
- `zsh`
- [`tmux-powerline`](https://github.com/erikw/tmux-powerline)
- A Nerd Font or patched font is recommended

Optional:

- [`zsh-vi-mode`](https://github.com/jeffreytse/zsh-vi-mode), for the `VI:I` / `VI:N` segment

---

## Installation

### 1. Install tmux-powerline

With TPM, add this to `~/.tmux.conf`:

```tmux
set -g @plugin 'erikw/tmux-powerline'
```

Then install TPM plugins with:

```txt
prefix + I
```

Manual installation:

```sh
mkdir -p ~/.tmux/plugins
git clone https://github.com/erikw/tmux-powerline ~/.tmux/plugins/tmux-powerline
```

---

### 2. Install tmux-powerline-minimal

Clone this repository:

```sh
git clone https://github.com/overflowed7/tmux-powerline-minimal ~/.config/tmux-powerline-minimal
```

Run the installer:

```sh
~/.config/tmux-powerline-minimal/install.sh
```

Reload zsh:

```sh
source ~/.zshrc
```

Reload tmux:

```sh
tmux source-file ~/.tmux.conf
tp -r
```

---

## Usage

```txt
  tp -l                  list themes
  tp -c                  show current theme
  tp -o                  show options
  tp -r                  reload
  tp -S                  list shapes
  tp -s <shape>          set shape: thin|pipe|angle|block
  tp -t <on|off>         transparency for gaps/base status
  tp -x <on|off>         left extras: hostname/ip/vpn
  tp <theme>             switch theme
```

## Themes

List themes:

```sh
tp -l
```


Included themes:

```txt
amber
blue
bluex
catppuccin
clean
cyber
darkvoid
dracula
ember
forest
grape
ice
matrix
monokai
nord
oxide
redline
scarlet
solar
solarized-osaka
sonokai
tokyonight
```


Switch theme:

```sh
tp darkvoid
tp matrix
tp ember
tp oxide
tp bluex
```

Show current theme:

```sh
tp -c
```

## Shapes

List separator shapes:

```sh
tp -S
```

Available shapes:

```txt
thin
pipe
angle
block
```

Examples:

```sh
tp -s thin
tp -s pipe
tp -s angle
tp -s block
```

---

## Transparency

Transparency affects the base status background and spacing areas.

Enable it:

```sh
tp -t on
```

Disable it:

```sh
tp -t off
```


---

## Left extras, Minimal toggle view

By default, the left side can show:

```txt
session | vi-mode | hostname | LAN IP | VPN
```

Disable extras:

```sh
tp -x off
```

Minimal left side:

```txt
session | vi-mode
```

Enable extras again:

```sh
tp -x on
```

---

## Segments

Custom segments included by this project:

| Segment | Description |
|---|---|
| `session_bold` | Shows tmux session/window/pane in bold |
| `zvm_mode` | Shows current zsh vi-mode state |

Common tmux-powerline segments used by themes:

| Segment | Description |
|---|---|
| `hostname` | Current hostname |
| `lan_ip` | Local IP address |
| `vpn` | Active VPN interface |
| `wan_ip` | Public IP, used by network-oriented themes |
| `pwd` | Current path |
| `vcs_branch` | Git branch |
| `vcs_modified` | Modified git files |
| `load` | Linux load average |
| `time` | Local time |
| `utc_time` | UTC time |

--

## File layout

Installed files:

```txt
~/.config/tmux-powerline/config.sh
~/.config/tmux-powerline/core/config.sh
~/.config/tmux-powerline/core/settings.sh
~/.config/tmux-powerline/core/theme-engine.sh
~/.config/tmux-powerline/core/tp.zsh
~/.config/tmux-powerline/core/current_theme
~/.config/tmux-powerline/themes/*.sh
~/.config/tmux-powerline/segments/session_bold.sh
~/.config/tmux-powerline/segments/zvm_mode.sh
```

The active theme is stored in:

```txt
~/.config/tmux-powerline/core/current_theme
```

Runtime options are stored in:

```txt
~/.config/tmux-powerline/core/settings.sh
```

---

## Troubleshooting

### `tp` command not found

Reload zsh:

```sh
source ~/.zshrc
```

Check that this line exists in `~/.zshrc`:

```sh
[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/core/tp.zsh" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/core/tp.zsh"
```

---

### Theme does not change

Reload tmux-powerline:

```sh
tp -r
```

Or reload tmux manually:

```sh
tmux source-file ~/.tmux.conf
tmux run-shell ~/.tmux/plugins/tmux-powerline/main.tmux
tmux refresh-client -S
```


---

## Uninstall

Run:

```sh
~/.config/tmux-powerline-minimal/uninstall.sh
```

Then reload zsh:

```sh
source ~/.zshrc
```

---

## License

MIT
