# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
EGIT_REPO_URI="git://gitorious.org/commonqt/commonqt.git"

inherit common-lisp-2 git

DESCRIPTION="CommonQt is a Common Lisp binding to the smoke library for Qt"
HOMEPAGE="http://common-lisp.net/project/commonqt/"

LICENSE="restricted"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=x11-libs/qt-core-4.5
		kde-base/smoke
		dev-lisp/cl-cffi
		dev-lisp/named-readtables
		dev-lisp/cl-ppcre
		dev-lisp/alexandria
		dev-lisp/cl-closer-mop
		dev-lisp/cl-iterate
		dev-lisp/trivial-garbage"
RDEPEND="${DEPEND}"

