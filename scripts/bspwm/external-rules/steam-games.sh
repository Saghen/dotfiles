#!/bin/sh
wid=$1
class=$2
instance=$3
consequences=$4
case "$class" in
*"steam_app"*|*"exe" )
echo "desktop=^5"
;;
esac
