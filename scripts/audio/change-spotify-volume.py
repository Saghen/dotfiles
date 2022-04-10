#!/usr/bin/env python3
import subprocess
import os
import sys
import re

amount = sys.argv[1] if len(sys.argv) > 1 else ''
if (len(amount) == 0):
    print('Value must be provided. Ex "+10%" "50%" "-5%"')
    sys.exit(2)

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

is_positive = amount.startswith('+')

match = re.search(r"\b\d+", amount)\

if (match is None):
    print('Invalid value provided. Ex valid values "+10%" "50%" "-5%"')
    sys.exit(3)

amount_int = int(match.group())
# from going over 100%
overflow = max(amount_int - (100 - volume), 0)

subprocess.run(['pactl', 'set-sink-input-volume', sink_id, '+' + str(amount_int - overflow) + '%' if is_positive else amount])
