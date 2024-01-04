export STEAM_FRAME_FORCE_CLOSE=1
export DISPLAY1=DP-0
export DISPLAY2=DP-2
export WLR_RENDERER=vulkan
# Multi threaded XZ compression/decrompression (if compressed with multi threading)
export XZ_DEFAULTS="-T 0"

# Enable wayland on GDK and Firefox and for some reason the main display
# gets a different name
if [[ $XDG_DESKTOP == "wayland" ]]; then
	export DISPLAY1=DP-1
	export MOZ_ENABLE_WAYLAND="1"
	export GDK_BACKEND="wayland"
fi

# kubectl
export KUBECONFIG="$HOME/.config/kube/config"

# home dir for assorted tools
export PNPM_HOME="$HOME/.local/share/pnpm"
export NPM_CONFIG_PREFIX="$HOME/.local/share/npm"
export CARGO_HOME="${HOME}/.local/share/cargo"
export RUSTUP_HOME="${HOME}/.local/share/rust"
export GOPATH="${HOME}/.local/share/go"
export RIPGREP_CONFIG_PATH="${HOME}/.config/ripgrep/ripgreprc"

# xdg
# todo: set this dynamically: export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# editor and viewers
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export MANPAGER='nvimpager'

# path
export PATH="$HOME/.cargo/env:$HOME/.local/bin:$HOME/scripts/bin:$GOPATH/bin:$HOME/.linkerd2/bin:$NPM_CONFIG_PREFIX/bin:$PATH"
. "/home/saghen/.local/share/cargo/env"
