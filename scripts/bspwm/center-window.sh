#!/bin/bash
xdo move -d -x $(bspc query -T -m focused | jq ".rectangle.x + .rectangle.width / 2 - $(bspc query -T -n focused | jq ".client.floatingRectangle.width / 2")") -y $(bspc query -T -m focused | jq ".rectangle.y + .rectangle.height / 2 - $(bspc query -T -n focused | jq ".client.floatingRectangle.height / 2")")
