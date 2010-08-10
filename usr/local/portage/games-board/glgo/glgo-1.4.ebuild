# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games

DESCRIPTION="PANDA-glGo is a 3D and 2D Goban, game viewer and editor, client for IGS-PandaNet and interface for GNU Go"
HOMEPAGE="http://www.pandanet.co.jp/English/glgo"
SRC_URI="http://panda-igs.joyjoy.net/English/glgo/downloads/glGo-${PV}.tar.gz"

LICENSE="custom"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/gtk+:2\
		media-libs/jpeg\
		>=media-libs/libpng-1.2\
		sys-libs/zlib\
		virtual/opengl\
		>=media-libs/libsdl-1.2\
		>=media-libs/sdl-image-1.2\
		>=media-libs/sdl-ttf-2.0\
		media-libs/freetype\
		>=x11-libs/pango-1.0\
		media-libs/fontconfig\
		>=dev-lang/python-2.4"
RDEPEND="${DEPEND}"

src_prepare() {
	check_license glGo.license
	rm glGo.install glGo.remove glGo.license
	for i in "/usr/games
		/usr/lib/games/glGo\
		/usr/share/games/glGo/\
		/usr/share/doc/glGo/html/images\
		/usr/share/games/glGo/cs_CZ\
		/usr/share/games/glGo/de_DE\
		/usr/share/games/glGo/es_ES\
		/usr/share/games/glGo/nl_NL\
		/usr/share/games/glGo/zh_CN"
	do
		dodir $i
	done
	cp ${FILESDIR}/Makefile ${WORKDIR}
}

src_install () {
	make
	dolib.so usr/lib/games/glGo/*.so
	dodoc usr/share/doc/glGo/*
	insinto /usr/share/games/glGo
	doins usr/share/games/glGo*
	exeinto /usr/games
	doexe usr/games/*
}
