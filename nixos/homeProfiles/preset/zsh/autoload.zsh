#!/usr/bin/env zsh

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
autoload -U bashcompinit && bashcompinit

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz zmv zcalc zargs url-quote-magic bracketed-paste-magic compinit

zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
