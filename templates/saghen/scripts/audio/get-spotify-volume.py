#!/usr/bin/env python3
import subprocess
import os
import sys

x = 0
y = 0
env = os.environ
env['LANG'] = 'en_US'
app = '"Spotify"'
pactl = subprocess.check_output(['pactl', 'list', 'sink-inputs'], env=env).decode().strip().split()

if not(app in pactl):
    print('Spotify not found')
    sys.exit(4)

for e in pactl:
    x += 1
    if e == app:
        break
for i in pactl[0 : x -1 ]:
    y += 1
    if i == 'Sink' and pactl[y] == 'Input' and '#' in pactl[y + 1]:
        sink_id = pactl[y+1]
    if i == 'Volume:' and '%' in pactl[y + 3]:
        volume = pactl[y + 3]

sink_id = sink_id[1: ]
volume = int(volume[ : -1 ])

print(volume)
