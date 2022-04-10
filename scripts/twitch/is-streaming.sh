#!/bin/bash

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

twitch api get streams -q user_id=$(twitch api get search channels -q query=$1 | jq '.data[0].id' -r) | jq '.data | length > 0'
