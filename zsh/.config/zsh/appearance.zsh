# Recheck at each prompt. Restore the original p10k configuration when returning
# to dark mode; only the light palette is overridden here.
_dotfiles_sync_appearance() {
  emulate -L zsh
  local appearance=day
  [[ "$(/usr/bin/defaults read -g AppleInterfaceStyle 2>/dev/null)" == Dark ]] && appearance=moon
  [[ ${_dotfiles_appearance:-} == $appearance ]] && return 0
  typeset -g _dotfiles_appearance=$appearance

  source "$HOME/.p10k.zsh"
  if [[ $appearance == day ]]; then
    # Replace fixed xterm colours with TokyoNight Day hues of the same family.
    local -A colors=(
      28 '#587539' 31 '#007197' 32 '#007197' 33 '#2e7de9'
      34 '#587539' 35 '#387068' 37 '#007197' 38 '#007197' 39 '#2e7de9'
      66 '#387068' 67 '#6172b0' 68 '#2e7de9' 70 '#587539' 72 '#387068'
      74 '#007197' 76 '#587539' 81 '#007197' 94 '#8c6c3e' 96 '#7847bd'
      99 '#7847bd' 103 '#6172b0' 106 '#587539' 110 '#2e7de9' 117 '#007197'
      125 '#c64343' 129 '#7847bd' 130 '#8c6c3e' 134 '#7847bd' 135 '#7847bd'
      160 '#c64343' 161 '#c64343' 166 '#b15c00' 168 '#c64343' 172 '#b15c00'
      178 '#8c6c3e' 180 '#8c6c3e' 196 '#c64343' 208 '#b15c00' 220 '#8c6c3e'
      240 '#6172b0' 244 '#6172b0' 248 '#6172b0' 255 '#3760bf'
    )
    local name value
    for name in ${(k)parameters}; do
      [[ $name == POWERLEVEL9K_*_FOREGROUND || $name == POWERLEVEL9K_*_COLOR ]] || continue
      value=${(P)name}
      [[ -n ${colors[$value]:-} ]] && typeset -g "$name=${colors[$value]}"
    done
    typeset -g POWERLEVEL9K_BACKGROUND='#d0d5e3'
    typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6172b0'
  else
    typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#8a7f45'
  fi
  (( $+functions[p10k] )) && p10k reload
  return 0
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _dotfiles_sync_appearance
unset _dotfiles_appearance
_dotfiles_sync_appearance
