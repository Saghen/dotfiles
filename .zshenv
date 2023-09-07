source ~/.profile

export PATH="/home/saghen/.local/share/go/bin:${KREW_ROOT:-$HOME/.krew}/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Move all the DIRs to .local/share
export CARGO_HOME="${HOME}/.local/share/cargo"
export RUSTUP_HOME="${HOME}/.local/share/rust"
export GOPATH="${HOME}/.local/share/go"
export RIPGREP_CONFIG_PATH="${HOME}/.config/ripgrep/ripgreprc"

# ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# user environment variables
# XDG Base Directories
# export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# editor and viewers
# export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export MANPAGER='less'
#export MANPAGER='nvimpager'

. "/home/saghen/.local/share/cargo/env"
