export LS_OPTIONS='--color=auto'
eval `dircolors`
eval `keychain --quiet --eval --noask id_rsa` #--nocolor
alias startx="startx &> .log"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias grep='grep --color=auto'
alias gmplayer="gnome-mplayer"
alias mplayer='mplayer -fs -x 1024 -y 768'
alias screenshot="scrot screenshot.png -c -d 3; imagebanana screenshot.png; rm screenshot.png"
alias sscreenshot="scrot screenshot.png -c -s -d 3; imagebanana screenshot.png; rm screenshot.png"
alias gcc='gcc -Wall -Wextra -ansi -pedantic -pedantic-errors '
alias vi="vim -p"
alias vim="vim -p"
alias kmap="xev | sed -n 's/^.*keycode *\([0-9]\+\).*$/keycode \1 = /p'"
alias sup="offlineimap -o -u 'Noninteractive.Quiet' &> /dev/null && sup-sync --optimize && sup 2> /dev/null"
alias ..='cd ..'
alias pdfv="apvlv"
alias emerge-bin="/usr/bin/emerge"
alias pclean="emerge --depclean && revdep-rebuild && emerge @preserved-rebuild &&  lafilefixer --justfixit && rm -rf /usr/portage/distfiles/* && rm -rf /var/tmp/portage/* && rm -rf /var/tmp/ccache/*"
alias nowplaying="ncmpcpp --now-playing \"%a - %t\""
#alias rm="rm -i"
alias xpaste='xclip -selection clipboard -o'
alias ventrillo='mangler'

export PATH=.:$HOME/bin:$HOME/httpd/bin:/opt/bin:/opt/sbin:/sbin:/usr/sbin:/usr/local/bin:/usr/games:/usr/games/bin:$PATH
export HISTFILESIZE=10000
export HISTSIZE=10000
export PAGER=most
export EDITOR=vim
export BROWSER=uzbl-tabbed
export HOSTALIASES=/etc/hosts
export IRCNAME="Bronsa"
export TERM=rxvt
export LANGUAGE=it
export CDPATH=
export MAIL=/home/bronsa/.mail
autoload zkbd
source /home/bronsa/.rxvt-:0.0
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char


prompt_command() {
    local pwdmaxlen=25
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
         NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit
prompt gentoo

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
setopt correctall
setopt hist_ignore_all_dups
setopt autocd
setopt extendedglob

zsh_prompt()  {
	curdir=`echo $PWD | sed -r -e 's/^.*(\/.*)$/\1/'`
	pathlen=`echo $curdir | wc -c`
	let pathlen=pathlen-1

	if [ $pathlen -gt 25 ]; then
		NEWPWD="../$curdir"
	else
		NEWPWD=$PWD
	fi
}

if (( UID != 0 )); then
	export PS1=$'%{\e[0;34m%}[%{\e[0;36m%}%~%{\e[0;34m%}] %{\e[00m%}~ '
else
	export PS1=$'%{\e[0;31m%}[%{\e[0;35m%}%~%{\e[0;31m%}] %{\e[00m%}# '
fi;
