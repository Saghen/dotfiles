#!/bin/bash
hueadm scenes -j | jq "to_entries | map(select(.value.name == \"$1\")) | .[0].key" -r
