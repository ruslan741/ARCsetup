
# Autostart applications
## Polybar or tint
~/.config/i3/polybar/polybar-i3 &


lxpolkit &
dunst -config ~/.config/i3/dunst/dunstrc &
picom --config ~/.config/i3/picom/picom.conf --animations -b &
#picom-b &
feh --bg-fill ~/.config/i3/wallpaper/wallhaven-rq7jw1_3440x1440.png &

# sxhkd
pkill -x sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
