# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EGIT_REPO_URI="git://gitorious.org/commonqt/commonqt.git"
EAPI=2

inherit common-lisp-2 qt4-r2 git

DESCRIPTION="CommonQt is a Common Lisp binding to the smoke library for Qt"
HOMEPAGE="http://common-lisp.net/project/commonqt/"

LICENSE="restricted"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+tutorial"
RESTRICT="strip"

DEPEND=">=x11-libs/qt-core-4.5
		kde-base/smoke
		dev-lisp/cl-cffi
		dev-lisp/named-readtables
		dev-lisp/cl-ppcre
		dev-lisp/alexandria
		dev-lisp/cl-closer-mop
		dev-lisp/cl-iterate
		dev-lisp/trivial-garbage
		dev-lisp/bordeaux-threads
		dev-lisp/babel"
RDEPEND="${DEPEND}"

src_prepare () {
	epatch ${FILESDIR}/qt.asd.patch
	cp ${FILESDIR}/commonqt.pro .
}

src_compile() {
	eqmake4
	emake
}

src_install() {
	common-lisp-install *.{lisp,asd}
	if use tutorial ; then
		common-lisp-install tutorial/*.lisp
	fi
	insinto /usr/share/common-lisp/source/commonqt
	doins commonqt.*
	doins libcommonqt.*
	common-lisp-symlink-asdf "qt"
}
