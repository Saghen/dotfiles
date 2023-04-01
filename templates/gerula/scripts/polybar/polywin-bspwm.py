#!/bin/python3

import os
import sys
import json

if (len(sys.argv) != 2):
    print("Please include the monitor name as the first argument")
    exit(1)

focused_desktop_id = os.popen(
    'bspc query -T -m {} | jq .focusedDesktopId'.format(sys.argv[1])).read()
focused_desktop_tree_raw = os.popen(
    'bspc query -T -d {}'.format(focused_desktop_id)).read()

focused_desktop_tree = json.loads(focused_desktop_tree_raw)

focused_node_id = focused_desktop_tree['focusedNodeId']

def parse_node(node):
    nodes = []
    if (node == None):
        return nodes

    if node['client'] != None:
        node['client']['id'] = node['id']
        nodes.append(node['client'])
    if 'firstChild' in node and node['firstChild'] != None:
        nodes.extend(parse_node(node['firstChild']))
    if 'secondChild' in node and node['secondChild'] != None:
        nodes.extend(parse_node(node['secondChild']))
    return nodes


nodes = parse_node(focused_desktop_tree['root'])


def add_actions_to_node(node):
    stringified = "%{{A1:bspc node -f {}:}}%{{A2:bspc node -c {}:}}{}%{{A}}%{{A}}".format(
        node['id'], node['id'], node['instanceName'])
    if node['id'] == focused_node_id:
        return "%{u#A4B9EF}%{+u}%{F#A4B9EF}" + stringified + "%{F-}%{-u}"
    return stringified


print(" ".join([add_actions_to_node(node) for node in nodes]))
