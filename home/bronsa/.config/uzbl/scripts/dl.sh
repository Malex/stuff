#!/bin/sh
# An enhanced version of the download script supplied with uzbl

# Some sites block the default wget --user-agent..
GET="wget --user-agent=Firefox --content-disposition --load-cookies=${XDG_DATA_HOME:-${HOME}/.local/share}/uzbl/cookies.txt -nv "

dest="${HOME}/Downloads/"
url="${8}"

[ "$url" ] || { echo "you must supply a url!i"; exit 1; }

cd "$dest"
file=$(${GET} "${url}" 2>&1| sed 's/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}[[:blank:]]\+[0-9:]\{8\}[[:blank:]]\+URL[^ ]\+ \[[0-9\/]\+\][[:blank:]]\+->[[:blank:]]\+"\([^"]\+\)".*$/\1/')
notify-send "Downloaded" "${file%%\?*}"
