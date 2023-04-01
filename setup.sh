#! /bin/bash
# shellcheck disable=SC2162
read -p "Do you have 'yay' already installed? [Y/n]: " response

if [ "$response" == "n" ] || [ "$response" == "N" ]; then
    echo "Installing yay..."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si
fi

read -p "What's your account user name? [user]: " username

echo "Preparing BSPWM for $username"

echo "Installing dependencies..."
#yay -S antigen starship polybar lsd fasd github-cli \
#      bspwm sxhkd xorg-xev xorg-utils xdo xorg-xrandr \
#      xorg-xmodmap ripgrep polkit-gnome mpv picom flameshot \
#      dunst mailspring cava kitty yadm ttf-icomoon-feather \
#      noto-fonts noto-fonts-emoji noto-fonts-extra \
#      ttf-noto-nerd rofi twitch-cli

title="Available Setups"
prompt="Pick an option: "
options=("saghen" "gerula")
selection="saghen"
echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do
    case "$REPLY" in
    [1-2]) selection=$opt; break;;
    $((${#options[@]}+1))) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;
    esac
done

template="templates/$selection"

if [ -f "$template"/post-setup.sh ]; then
  echo "Loading $template..."
  sudo chmod +x ./"$template"/post-setup.sh
  ./"$template"/post-setup.sh username
else
  echo "Template not found. Aborting."
  exit
fi

echo "Copying files"

echo "Hello Baby!"