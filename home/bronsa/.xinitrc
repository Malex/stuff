setxkbmap it 
xmodmap /home/bronsa/.Xmodmap
feh --bg-fill /home/bronsa/Images/sfondo.png
xsetroot -cursor_name left_ptr
sh /home/bronsa/bin/mode-line-info.sh &
urxvtd &
exec stumpwm
#exec fluxbox
