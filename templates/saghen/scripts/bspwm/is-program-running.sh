#!/bin/bash
PROGRAM="$1"
PROCESS=$(ps aux | awk '{print $11}' | grep "$PROGRAM")
[ -z "$PROCESS" ] && echo "false" || echo "true"
