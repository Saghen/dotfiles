display_usage() {
  echo "Usage: is-streaming [channel-name]"
}

# if less than one arguments supplied, display usage
if [ $# -lt 1 ]; then
  display_usage
  exit 1
fi

# check whether user had supplied -h or --help . If yes display usage
if [[ ($1 == "--help") || $1 == "-h" ]]; then
  display_usage
  exit 0
fi

xdg-open https://twitch.tv/$1
