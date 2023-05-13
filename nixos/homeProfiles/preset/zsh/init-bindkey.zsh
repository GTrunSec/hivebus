#!/usr/bin/env zsh

# https://superuser.com/questions/427163/altarrow-moving-between-words-in-zsh-and-iterm2
bindkey "\e[1;3C" emacs-forward-word
bindkey "\e[1;3D" emacs-backward-word

bindkey -M emacs '^x' fzf-cd-widget
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down

bindkey "^[[1;5C" vi-forward-word
bindkey "^[[1;5D" vi-backward-word

bindkey '^Z' fzf-z-widget

[[ -n "$key[Up]" ]] && bindkey -- "$key[Up]" up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
