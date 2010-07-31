# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games eutils

DESCRIPTION="GtkAtlantic is a game like Monopoly(tm). GtkAtlantic is a network client that works with the monopd server."
HOMEPAGE="http://gtkatlantic.gradator.net"
SRC_URI="http://download.tuxfamily.org/gtkatlantic/downloads/v0.4/gtkatlantic-${PV}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/gtk+:2\
		>=dev-libs/libxml2-2.4\
		>=media-libs/libpng-1.0"
RDEPEND="dev-util/pkgconfig
		${DEPEND}"

src_prepare () 
{
	epatch "${FILESDIR}"/${P}-libpng14.patch
}

src_configure () {
	econf || die "configure failed"
}

src_compile () {
	emake || die "make failed"

}
src_install () {
	emake install DESTDIR="${D}" || die "make install failed"
	dodoc AUTHORS ChangeLog NEWS README
	prepgamesdirs
}
