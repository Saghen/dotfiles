#!/usr/bin/env zsh

# TODO fix autocomplete issue (\*)

# install zinit if it isn't already installed
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# load zinit
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load annexes
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl

# zsh prompt
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# can't load this one in turbo mode, abbr is used in aliases.zsh
zinit light olets/zsh-abbr

# lazy-load plugins with turbo mode
zinit wait lucid for \
  ael-code/zsh-colored-man-pages \
  Aloxaf/fzf-tab \
  hlissner/zsh-autopair \
  le0me55i/zsh-systemd \
  wait"1" \
    laggardkernel/zsh-thefuck \
  LucasLarson/gunstage \
  OMZP::command-not-found \
	OMZP::docker \
	OMZP::docker-compose \
  OMZP::github \
  OMZP::kubectl \
  OMZP::man \
  OMZP::transfer \
  wait"2" atload="__kitty_complete" \
    redxtech/zsh-kitty \
  redxtech/zsh-load-module \
  redxtech/zsh-unix-simple \
  voronkovich/gitignore.plugin.zsh \
  zsh-users/zsh-history-substring-search \
  zpm-zsh/ssh \
  Tarrasch/zsh-bd

# history
zinit ice lucid wait"0a" from"gh-r" as"program" bpick'*x86_64-unknown-linux*' atload'eval "$(mcfly init zsh)"'
zinit light cantino/mcfly

# fzf history
# export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS="0"
# export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH="0"
# export ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES="1"
# zinit ice wait lucid
# zinit light joshskidmore/zsh-fzf-history-search

# vim
# zinit ice depth=1
# zinit light jeffreytse/zsh-vi-mode

# z
eval "$(zoxide init zsh)"
# Not using the plugin because I can't figure out how to avoid changing the data dir
#_ZO_DATA_DIR=$XDG_DATA_HOME
#zinit has'zoxide' wait lucid for \
#  z-shell/zsh-zoxide

# codex
# zinit ice src"zsh_codex.plugin.zsh"
# zinit has'openai' atload"bindkey '^X' create_completion" wait lucid for \
  # saghen/zsh_codex_zinit

# distro specific plugins
local CURRENT_DISTRO="$(lsb_release -is)"
if test "$CURRENT_DISTRO" = "Arch" -o "$CURRENT_DISTRO" = "EndeavourOS" -o "$CURRENT_DISTRO" = "Garuda" -o "$CURRENT_DISTRO" = "ManjaroLinux"; then
  zinit wait lucid for \
    OMZP::archlinux
elif test "$CURRENT_DISTRO" = "Rocky"; then
	zinit wait lucid for \
		OMZP::dnf
elif test "$CURRENT_DISTRO" = "Ubuntu"; then
  zinit wait lucid for \
    OMZP::ubuntu
fi
unset CURRENT_DISTRO

# binaries from github releases
# TODO add atclone command to move completions for all entries?
zinit wait lucid from'gh-r' as"command" for \
  mv'fd* fd' sbin'**/fd(.exe|) -> fd' \
    @sharkdp/fd \
  mv'bat* bat' sbin'**/bat(.exe|) -> bat' \
    @sharkdp/bat \
  mv'rip* ripgrep' sbin'**/rg(.exe|) -> rg' \
    BurntSushi/ripgrep \
  sbin"**/bin/nvim -> nvim" ver"nightly" \
    neovim/neovim \
  mv"yq* yq" sbin'**/yq(.exe|) -> yq' \
    mikefarah/yq

# binaries from github repos
zinit as"command" wait lucid for \
  sbin \
    dylanaraps/neofetch \
  sbin"bin/switchup" \
    redxtech/switchup

# asdf for managing node, python, go, ...
zinit light redxtech/zsh-asdf-direnv

# completions packages
zinit ice as"completion" mv"completion.zsh -> _delta" wait lucid
zinit snippet https://github.com/dandavison/delta/blob/master/etc/completion/completion.zsh
zinit wait lucid for \
  atclone"./zplug.zsh" \
    g-plane/zsh-yarn-autocompletions \
  greymd/docker-zsh-completion \
  ryutok/rust-zsh-completions

zinit ice pick'poetry.zsh'
zinit light sudosubin/zsh-poetry

# completions, syntax highlighting, and autosuggestions
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay; compdef kubecolor=kubectl" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

