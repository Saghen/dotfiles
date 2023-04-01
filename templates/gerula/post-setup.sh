#! /bin/bash

username=$1

echo "Configuring the environment..."

cp -r ./.config/bspwm ~/.config/bspwm
cp -r ./.config/dunst ~/.config/dunst
cp -r ./.config/kitty ~/.config/kitty
cp -r ./.config/picom ~/.config/picom
cp -r ./.config/polybar ~/.config/polybar
cp -r ./.config/rofi ~/.config/rofi
cp -r ./.config/sxhkd ~/.config/sxhkd

cp -r ./scripts ~/
cp -r ./styling ~/
cp -r ./.fonts ~/
cp .profile ~/
cp .zshenv ~/
cp .zshrc ~/

sed -i "s/<user>/$username/" ~/.profile
sed -i "s/<user>/$username/" ~/.zshenv

sudo rm -rf /usr/share/X11/xkb/symbols/pc
sudo touch /usr/share/X11/xkb/symbols/pc
cat ./scritps/usr-share-X11-xkb-symbols-pc >> /usr/share/X11/xkb/symbols/pc

