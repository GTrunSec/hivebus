#!/usr/bin/env zsh

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
autoload -U bashcompinit && bashcompinit

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
