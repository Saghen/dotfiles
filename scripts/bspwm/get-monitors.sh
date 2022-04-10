echo $(xrandr --listmonitors | sed -n '2p' | awk {'print $4'})
echo $(xrandr --listmonitors | sed -n '3p' | awk {'print $4'})
