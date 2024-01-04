#!/usr/bin/env zsh

# basic environment
EDITOR="nvim"
VISUAL="nvim"
TERMINAL="$(command -v kitty)"
BROWSER="$(command -v firefox-nightly)"

# export the variables
export EDITOR
export TERMINAL
export BROWSER

# program specific
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BAT_THEME=Dracula
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#1e1e28,hl:#67cbff --color=fg+:#f8f8f2,bg+:#332E41,hl+:#67cbff --color=info:#67cbff,prompt:#98C379,pointer:#67cbff --color=marker:#67cbff,spinner:#ffb86c,header:#6272a4'
