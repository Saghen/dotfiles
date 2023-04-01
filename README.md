# BSPWM Configuration Guide

Follow the steps below to set up your BSPWM environment with the necessary tools and configurations.
## Prerequisites

Manjaro Linux installed on your system.

## Installation

### Step 1: Install yay

Install yay (Yet Another Yaourt) package manager with the following command:

```bash
$ sudo pacman -S --needed base-devel git
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```
### Step 2: Install required packages

Use yay to install the necessary packages with the following command:

```bash

$ yay -S antigen starship polybar lsd fasd github-cli \
      bspwm sxhkd xorg-xev xorg-utils xdo xorg-xrandr \
      xorg-xmodmap ripgrep polkit-gnome mpv picom flameshot \
      dunst mailspring cava kitty yadm ttf-icomoon-feather \
      noto-fonts noto-fonts-emoji noto-fonts-extra \
      ttf-noto-nerd rofi twitch-cli
```
### Step 3: Copy configuration files

1. Copy the `bspwm, cava, dunst, kitty, picom, polybar, rofi, sxhkd` folders from the `.config`
folder to `/home/<user>/.config`.
2. Copy `scripts, styling, .profile, .zshenv, .zshrc` to `/home/<user>.`
3. Copy the `.fonts` folder to `/home/<user>`.

### Step 4: Update user references

Replace <user> with your actual username in the following files:

- `.profile`
- `.zshenv`

### Step 5: Update XKB symbols

Update your `/usr/share/X11/xkb/symbols/pc` to be the same as `scripts/usr-share-X11-xkb-symbols-pc`.

### Step 6 (Optional): Install recommended applications

For the default configuration, install Discord, Spotify, and Steam to ensure proper launching:

- Discord: https://discord.com/download
- Spotify: https://www.spotify.com/download/linux/
- Steam: https://store.steampowered.com/about/

That's it! Your BSPWM environment should now be configured with the necessary tools and settings.