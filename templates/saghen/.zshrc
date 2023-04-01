# https://gist.github.com/gubatron/1eb077a1c5fcf510e8e5
function command_exists {
  type "$1" &> /dev/null
}

# completion; use cache if updated within 24h
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;
# Completions go in ~/.zfunc
fpath+=~/.zfunc

# Save history so we get auto suggestions
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Options
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances
setopt interactive_comments # allow comments in interactive shells

# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# FASD
if command_exists fasd; then eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-wcomp)"; fi

# Load antibody plugin manager
# yay -S antigen
source /usr/share/zsh/share/antigen.zsh

# Plugins
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle hlissner/zsh-autopair
antigen bundle wfxr/forgit

antigen apply

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey '^H' backward-kill-word
bindkey ';5D' backward-word
bindkey ';5C' forward-word

# Prompt
eval "$(starship init zsh)"

npr() {
    npm run --silent $1 -- ${@:2}
}

fix-kube-config-perms() {
  chmod go-r ~/.kube/config
}

ssh-kube() {
  eval $(ssh-agent -s) && ssh-add ~/.ssh/kube && ssh root@super.fish
}

nvim() {
  kitty @ set-spacing padding=0
  /usr/bin/nvim $@
  kitty @ set-spacing padding=default
}

if command_exists kubectl; then alias k="kubectl"; fi
if command_exists lsd; then alias ls="lsd"; fi
if command_exists lazygit; then alias lg="lazygit"; fi

if [ -f "/usr/share/doc/git-extras/git-extras-completion.zsh" ]; then
  source /usr/share/doc/git-extras/git-extras-completion.zsh
fi

# FNM
if command_exists fnm; then eval "$(fnm env --use-on-cd)"; fi
