
# Autostart applications
~/.config/i3/polybar/polybar-i3 &
# home
xrandr --output HDMI-0 --mode 1920x1080 --scale 1x1 --rate 75 --primary --pos 0x0 --output HDMI-1 --mode 1920x1080 --scale 0.9x0.9 --rate 60 --pos 1920x0 
# work
# xrandr --output HDMI-0 --mode 1920x1080 --scale 1x1 --pos 0x0 --output HDMI-1 --mode 1920x1080 --scale 0.9x0.9 --pos 1920x0 

# work time
xset dpms 0 0 0
xset s noblank
xset s off

lxpolkit &
dunst -config ~/.config/i3/dunst/dunstrc &
picom --config ~/.config/i3/picom/picom.conf -b &
# picom --config ~/.config/i3/picom/picom.conf --animation-for-open-window none --animation-for-transient-window none --no-fading-openclose --no-fading-destroyed-argb -b &

#feh --bg-fill ~/.config/i3/wallpaper/wallhaven-gwj213.jpg &

setxkbmap -layout us,ru -option grp:win_space_toggle


# sxhkd
pkill -x sxhkd

sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
wal -R -n
