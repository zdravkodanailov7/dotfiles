#!/bin/sh
# Called at startup and by tmux's status refresh; emit no status text.
appearance=day
if [ "$(/usr/bin/defaults read -g AppleInterfaceStyle 2>/dev/null)" = Dark ]; then
  appearance=moon
fi

current=$(tmux show-option -gqv @tokyonight_appearance) || exit 0
if [ "$current" != "$appearance" ]; then
  tmux source-file "$HOME/.tmux/tokyonight-$appearance.conf" &&
    tmux set-option -g @tokyonight_appearance "$appearance"
fi
