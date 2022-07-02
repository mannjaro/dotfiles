eval "$(starship init zsh)"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' completer _complete _approximate _prefix
zstyle ':completion:*:default' menu select=1

setopt auto_cd
setopt auto_menu
setopt correct
setopt magic_equal_subst
setopt nobeep
setopt nolistbeep
setopt print_eight_bit
setopt share_history
