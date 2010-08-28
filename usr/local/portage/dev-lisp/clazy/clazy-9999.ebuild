# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit common-lisp-2
EAPI=3

DESCRIPTION="Common Lisp Lazy Evaluation Libray"
HOMEPAGE="http://www.common-lisp.org/project/clazy/"
SRC_URI="http://common-lisp.net/cgi-bin/viewcvs.cgi/root.tar.gz?root=clazy&view=tar \
	-> clazy.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install () {
	cd clazy/clazy
	common-lisp-install *.{lisp,asd}
	common-lisp-install */*.lisp
	common-lisp-symlink-asdf
}
