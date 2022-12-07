setopt hist_verify        # reload full command when runing from history
setopt notify             # report the status of backgrounds jobs immediately
setopt hist_ignore_space  # do not remember commands starting with space
setopt hist_reduce_blanks # reduce whitespace in history

setopt auto_continue #automatically send SIGCON to disowned jobs

# Fancy substitutions in prompts
setopt prompt_subst
setopt transient_rprompt

# If a pattern for filename generation has no matches, print an error, instead
# of leaving it unchanged in the argument  list. This also applies to file
# expansion of an initial ‘~’ or ‘=’.
setopt NOMATCH

# no Beep on error in ZLE.
setopt NO_BEEP
