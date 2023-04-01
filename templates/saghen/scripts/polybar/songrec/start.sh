#!/bin/bash
echo "Listening..." >> "$1"
songrec listen -d pipewire >> "$1"
