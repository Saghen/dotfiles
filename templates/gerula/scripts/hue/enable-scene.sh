#!/bin/bash
hueadm group 0 scene=$($(dirname $0)/get-scene-id.sh "$1")
