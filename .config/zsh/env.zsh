#!/usr/bin/env zsh

# basic environment
EDITOR="nvim"
VISUAL="nvim"
TERMINAL="$(command -v kitty)"
BROWSER="$(command -v firefox-nightly)"

# if nvim is installed switch the variable to that
if command -v nvim>/dev/null; then
    EDITOR="$(command -v nvim)"
fi

# export the variables
export EDITOR
export TERMINAL
export BROWSER

# program specific
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BAT_THEME=Dracula
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#1e1e28,hl:#67cbff --color=fg+:#f8f8f2,bg+:#332E41,hl+:#67cbff --color=info:#67cbff,prompt:#98C379,pointer:#67cbff --color=marker:#67cbff,spinner:#ffb86c,header:#6272a4'

# TODO: see if plugin for this
# source local env file
if test -f "$HOME/.config/zsh/env.local.zsh"; then
    source "$HOME/.config/zsh/env.local.zsh"
fi

# GKE
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
