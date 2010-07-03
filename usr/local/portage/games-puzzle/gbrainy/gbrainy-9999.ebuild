# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EGIT_REPO_URI="git://git.gnome.org/gbrainy.git"

inherit eutils games git

DESCRIPTION="A brain teaser game and trainer to have fun and to keep your brain trained"
HOMEPAGE="http://live.gnome.org/gbrainy"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-util/intltool-0.35\
		>=dev-lang/mono-1.1.7\
		dev-dotnet/gnome-sharp\
		x11-libs/gtk+\
		dev-dotnet/gtk-sharp\
		>=gnome-base/librsvg-2.2\
		>=x11-libs/cairo-1.2\
		>=dev-dotnet/mono-addins-0.3"
RDEPEND="${DEPEND}"

src_compile() {
	/bin/sh autogen.sh || die "autogen failed"
	econf || die "configure failed"
}
src_install() {
	emake DESTDIR="${D}" install || die "make failed"
}
