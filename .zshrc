#!/usr/bin/env zsh

# custom zsh config location
ZSH_CUSTOM="$HOME/.config/zsh"

# zsh config
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT="[%F %T] "

# emacs bindings because working in neovim
bindkey -e

# zsh options
setopt auto_cd                    # auto cd into dirs
setopt append_history             # each shell adds its history on exit
setopt hist_ignore_dups           # keep duplicates in the histfile, if not consecutive
setopt hist_ignore_space          # prefix command with space to exclude from history
setopt extended_glob              # include #, ^, & ~ in globbing
setopt hist_reduce_blanks         # remove unnecessary spaces
setopt no_correct                 # don't do corrections
setopt notify                     # show backgrounded jobs immediately
setopt prompt_subst               # expand functions in prompt
setopt transient_rprompt          # don't include right prompt in history 
setopt function_arg_zero          # set $0 for each function, script, etc
setopt no_menu_complete           # autocomplete menu

# GOOD keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey -r "^M"

# hyphen & case insensitive completions 
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'

# all zinit config here
source "$ZSH_CUSTOM/zinit.zsh" 
source "$ZSH_CUSTOM/init.zsh"
