id=$1;mplayer -fs  http://youtube.com/get_video.php?video_id=$id\&t=$(curl -s http://www.youtube.com/watch?v=$id | sed -n 's/.*, "t": "\([^"]*\)", .*/\1/p')
