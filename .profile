export STEAM_FRAME_FORCE_CLOSE=1
export PATH="$HOME/.cargo/env:$HOME/.local/bin:$HOME/scripts/bin:$GOPATH/bin:$HOME/.linkerd2/bin:$PATH"
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

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
