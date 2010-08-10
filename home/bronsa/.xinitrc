setxkbmap it 
xmodmap /home/bronsa/.Xmodmap
xsetroot -cursor_name left_ptr
sh /home/bronsa/bin/mode-line-info.sh &
urxvtd &
#exec urxvt
exec stumpwm
#exec openbox
