import urllib.request
import json
from dataclasses import dataclass
import os
import pickle

# helpers
@dataclass
class Channel:
    name: str
    display_name: str

def make_http_request(url):
    # read twitch cli config
    with open(os.path.expanduser("~/.config/twitch-cli/.twitch-cli.env"), "r") as config_file:
        lines = config_file.readlines()
        lines = [line.strip() for line in lines if line.strip() != ""]
        twitch_config = dict([line.split("=") for line in lines])
        token = twitch_config["ACCESSTOKEN"]
        client_id = twitch_config["CLIENTID"]

    # make request
    request = urllib.request.Request(url, headers={ "Authorization": f"Bearer {token}", "Client-Id": client_id })
    response = urllib.request.urlopen(request)
    data = response.read()
    return json.loads(data)

# configuration
channels = [
    Channel(name="ster2ster", display_name="⭐"), 
    Channel(name="ster", display_name="⭐"), 
    Channel(name="Simply", display_name="🎩"), 
    Channel(name="moonmoon", display_name="🌛"),
    Channel(name="atrioc", display_name="💰"),
    Channel(name="jerma985", display_name="👴"),
    Channel(name="mizkif", display_name="🦧"),
    Channel(name="liam", display_name="🍛"),
    Channel(name="clintstevens", display_name="⌚")
]

# load previous live channels
if not os.path.exists("/tmp/twitch-live-channels"):
    with open("/tmp/twitch-live-channels", "wb") as f:
        pickle.dump([], f)
with open("/tmp/twitch-live-channels", "rb") as f:
    previous_live_channels = pickle.load(f)

# get current live channels
user_logins = "&".join([f"user_login={channel.name}" for channel in channels])
result = make_http_request(f"https://api.twitch.tv/helix/streams?{user_logins}")["data"]
live_channels = [channel for channel in channels if any([channel.name == stream["user_login"] for stream in result])]
with open("/tmp/twitch-live-channels", "wb") as f:
    pickle.dump(live_channels, f)

# print output and send notifications for new live channels
if len(live_channels) > 0:
    print(" ".join([f"%{{A1:xdg-open https\\://twitch.tv/{channel.name}:}}{channel.display_name}%{{A}}" for channel in live_channels]))
    new_live_channels = [channel for channel in live_channels if channel not in previous_live_channels]
    for channel in new_live_channels:
        os.system(f"notify-send -i twitch '{channel.name.capitalize()} has gone live'")
