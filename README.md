# Dotfiles

Managed with GNU stow. Each top-level folder is a stow package mirroring its path relative to $HOME.

Usage: `cd ~/dotfiles && stow <package>`

## macOS appearance

Ghostty follows System Settings → Appearance: Dark uses TokyoNight Moon and
Light uses TokyoNight Day. Reload Ghostty configuration with Cmd+Shift+, once
after installing these settings; later system appearance changes are automatic.

Neovim checks macOS appearance on startup, focus, and every two seconds. TokyoNight
and lualine follow its background setting, including inside tmux 3.5a.
Restart existing Neovim instances once after installing the configuration.

tmux checks appearance every five seconds through its status refresh. The helper
and both palettes live under `~/.tmux`; reload with `tmux source-file ~/.tmux.conf`.
This polling requires the status bar to remain enabled.

Powerlevel10k checks at each new prompt, preserving the original dark colours and
using Day colours in light mode. For an existing shell, load the hook once with
`source ~/.config/zsh/appearance.zsh`. New shells load it automatically.
Lazygit uses terminal palette colours already, so it follows Ghostty (or Neovim's
terminal palette when launched there) without a separate RGB theme.
Reopen Lazygit or other embedded terminal sessions inside Neovim after switching:
Neovim 0.11 reads their ANSI palette when the terminal buffer is first created.
