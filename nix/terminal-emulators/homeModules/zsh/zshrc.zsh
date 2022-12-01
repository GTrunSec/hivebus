ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#fdf6e3,bg=#586e75,bold,underline"

export TERM=xterm-256color
export EDITOR="emacsclient -nw"
export VISUAL=$EDITOR

fzf-z-widget() {
  if type "z" >/dev/null; then
    cd "$(echo $(z -t -l | cut -d' ' -f2- | tr -d ' ' | fzf --tac))"
    zle reset-prompt
  fi
}

zle -N fzf-z-widget
