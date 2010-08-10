# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EGIT_REPO_URI="git://pwmt.org/jumanji.git"

EAPI=2

inherit eutils git

DESCRIPTION="jumanji is a highly customizable and functional web browser based
on the libwebkit web content engine and the gtk+ toolkit."

HOMEPAGE="http://pwmt.org/projects/jumanji"

LICENSE="custom"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND=">=x11-libs/gtk+-2.18.6\
		>=net-libs/webkit-gtk-1.2.1\
		>=net-libs/libsoup-2.22.4\
		>=dev-libs/libunique-1.1.6\
		>=dev-libs/glib-2.22.4"
RDEPEND="${DEPEND}"

src_prepare() {
	git_src_prepare
	tc-export CC
	append-cflags -std=c99
	sed -i -e '/${CC}/s:${CFLAGS}:\0 ${INCS}:' Makefile || die
}

src_compile() {
	emake || die "emake failed"
}
src_install() {
	dodoc jumanji.1
	dobin jumanji
	if use debug; then
		make debug
	fi
}
