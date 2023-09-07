#!/bin/bash
echo "Listening..." >>"$1"
songrec listen -d pulse >>"$1"
