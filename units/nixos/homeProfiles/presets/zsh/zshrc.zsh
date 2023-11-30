zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors '\'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
_comp_options+=(globdots)

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
