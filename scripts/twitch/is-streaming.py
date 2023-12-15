import urllib.request
import json
from dataclasses import dataclass
import os

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

# main
user_logins = "&".join([f"user_login={channel.name}" for channel in channels])
result = make_http_request(f"https://api.twitch.tv/helix/streams?{user_logins}")["data"]

live_channels = [channel for channel in channels if any([channel.name == stream["user_login"] for stream in result])]

if len(live_channels) > 0:
    print(" ".join([f"%{{A1:xdg-open https\\://twitch.tv/{channel.name}:}}{channel.display_name}%{{A}}" for channel in live_channels]))
