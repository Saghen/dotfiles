#!/usr/bin/env zsh

# some ls shortcuts
alias la="ls -al"
alias ll="ls -l"
alias l="ls -l"

# make rm safer
alias rm="rm -I"

# mv is now verbose
alias mv="mv -v"

# new makedir command
alias mkd="mkdir -pv"

# git
alias gco="git checkout"
alias gcob="git checkout -b"

# make various commands use colour
alias grep="grep --color"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# show info on rsync
alias rsync="rsync --info=progress2 -r"

# rclone shortcut
alias rcp="rclone copy -P --transfers=20"

# reload the session
alias src="exec zsh"

# redo last command as sudo
alias shit='sudo $(fc -ln -1)'

# clipboard alias
alias xclip="xclip -selection c"

# unarchive with atool
alias expand-dong="aunpack"

# show remaining progress with `sync` command
alias dirties="watch -d grep -e Dirty: -e Writeback: /proc/meminfo"

# neofetch with image
alias neofetchk="neofetch --backend kitty --source .config/wall.png"

# edit the todo file
alias todo="$EDITOR ~/.todo.md"

# terminal multiplexer(s)
alias zj="zellij"
alias zj-clean="rm -rf $HOME/.cache/zellij"

# interactive recursive folder sizes
alias dua="dua i"

# ranger
alias f="ranger"
alias ff="source ranger"

# vim -> nvim
if command -v nvim >/dev/null; then
  alias vim="nvim"
fi

# goneovim -> gvim
if command -v goneovim >/dev/null; then
  alias gvim="goneovim"
  alias gnvim="gvim"
fi

# ls -> lsd
if command -v exa >/dev/null; then
  alias ls="lsd"
fi

# cat -> bat
#if command -v bat >/dev/null; then
#  alias cat="bat"
#fi

# ping -> prettyping
if command -v prettyping >/dev/null; then
  alias ping="prettyping --nolegend"
fi

# pipes.sh -> pipes
if command -v pipes.sh >/dev/null; then
  alias pipes="pipes.sh -p 4 -t 3 -r 10000"
fi

# some command aliaseviations
alias e='$EDITOR'
alias v='$EDITOR'
alias svim="sudo -e"
alias ps_mem="sudo ps_mem"

# systemctl commands
alias ss="sudo systemctl"
alias sss="sudo systemctl start"
alias ssst="sudo systemctl stop"
alias ssr="sudo systemctl restart"
alias sse="sudo systemctl enable --now"
alias ssdr="sudo systemctl daemon-reload"

# swallow windows for certain apps
if command -v devour >/dev/null; then
  local swallowed=(feh mpv sxiv)

  for app in $swallowed; do
		if command -v $app >/dev/null; then
			alias $app="devour $app"
		fi
  done
fi

# docker aliases
# alias docker="podman"
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"
# alias docker-nuke="docker rm (docker ps -q -a) && docker rmi (docker images -q -a)"

# kubernetes aliases
alias kx="kubectx"
alias kn="kubens"
alias kt="kubetui"
alias kth="kubetui -s h"
alias kubectl="kubecolor"
alias kaf="kubectl apply -f"
alias kak="kubectl apply -k"
alias krr="kubectl rollout restart"
alias kl="kubectl logs"
alias kg="kubectl get"
alias kgp="kubectl get pod"
alias kd="kubectl describe"
alias kdp="kubectl describe pod"

# lazygit for dotfiles
alias ly="lazygit --git-dir=$HOME/.local/share/yadm/repo.git --work-tree=$HOME"
alias lg="lazygit"

# for fun
alias starwars="telnet towel.blinkenlights.nl"
alias excuse="fortune bofh-excuses | yosay"
alias excuse-cow="fortune bofh-excuses | cowsay"

## abbreviations

# default to session and quiet
if command -v abbr >/dev/null; then
  alias abbr="abbr -S --quiet"
else
  alias abbr="alias"
fi

# my common misspellings
abbr ecoh="echo"
abbr pacuar="pacaur"
abbr sudp="sudo"
abbr yarm="yarn"
abbr clera="clear"
abbr claer="clear"

# npm
npr() {
    npm run --silent $1 -- ${@:2}
}
pnpr() {
    if [ "$#" -le 1 ]; then
        pnpm run --silent $1
    else
        pnpm run --silent $1 -- ${@:2}
    fi
}

# nvim
nvim() {
  # check if in neovim and run with support for flatten.nvim
  if [ -n "$NVIM" ]; then
    nvim --cmd 'let g:flatten_wait=1' $@
    return
  fi
  # check if not in kitty and run normally
  if [ -z "$KITTY_WINDOW_ID" ]; then
    /usr/bin/nvim $@
    return
  fi
  kitty @ set-spacing padding=0
  /usr/bin/nvim $@
  kitty @ set-spacing padding=default
}
alias nv="neovide --multigrid"

# helix
helix() {
  kitty @ set-spacing padding=0
  /usr/bin/helix $@
  kitty @ set-spacing padding=default
}
