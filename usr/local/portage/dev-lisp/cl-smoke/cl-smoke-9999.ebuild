# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#EDARCS_REPOSITORY="http://tobias.rautenkranz.ch/lisp/cl-smoke/"
EAPI=2

inherit darcs common-lisp-2 cmake-utils eutils

DESCRIPTION="Common Lisp bindings for Qt and KDE using Smoke"
HOMEPAGE="http://tobias.rautenkranz.ch/lisp/cl-smoke/"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="commonqt doc kde dbus examples +network opengl phonon tests webkit repl"
RESTRICT="strict"

DEPEND="x11-libs/qt-core\
	kde-base/smoke\
	dev-lisp/alexandria\
	dev-lisp/bordeaux-threads\
	dev-lisp/cl-closer-mop\
	dev-lisp/cl-cffi\
	dev-lisp/trivial-garbage\
	dev-util/cmake\
	doc? ( dev-libs/libxml2 )\
	doc? ( dev-java/saxon )\
	doc? ( app-text/docbook-xml-dtd )\
	doc? ( dev-libs/libxslt )"
RDEPEND="${DEPEND}"

src_unpack () {
	REPOS="smoke qt.core qt.gui qt.uitools"
	for i in commonqt repl; do
		if use ${i} ; then
			REPOS="${REPOS} ${i}"
		fi
	done
	if use kde ; then
		REPOS="${REPOS} kde.core kde.ui"
	fi
	for i in dbus network opengl phonon webkit; do
		if use ${i} ; then
			REPOS="${REPOS} qt.${i}"
		fi
	done
	for i in tests examples; do
		if use ${i}; then
			REPOS="${REPOS} qt.${i}"
			if use kde; then
				REPOS="${REPOS} kde.${i}"
			fi
		fi
	done
	for i in $REPOS doc; do
		EDARCS_REPOSITORY="http://tobias.rautenkranz.ch/lisp/cl-smoke/${i}"
		EDARCS_TOP_DIR="${PORTAGE_ACTUAL_DISTDIR-${DISTDIR}}/darcs-src/cl-smoke/"
		EDARCS_LOCALREPO=""
		darcs_src_unpack
	done

	rm -rf "${WORKDIR}/${P}"
	mkdir -p "${WORKDIR}/${P}"
	rsync -rlpgo --exclude="_darcs/" "${PORTAGE_ACTUAL_DISTDIR-${DISTDIR}}/darcs-src/cl-smoke/" "${WORKDIR}/${P}"
}

src_configure () {
	for i in smoke qt.core; do
		CMAKE_USE_DIR="${S}"/${i}
		cmake-utils_src_configure 
	done
}

src_compile () {
	for i in smoke qt.core; do
		CMAKE_USE_DIR="${S}"/${i}
		cmake-utils_src_compile
	done
	if use doc ; then
		cd ${S}/doc
		emake
	fi
}

src_install () {
	for i in smoke_build qt.core_build; do
		CMAKE_USE_DIR="${S}"/${i}
		cmake-utils_src_install
	done
	for i in $REPOS ; do
		rm -rf $i/CMakeLists.txt
		common-lisp-install $i
		common-lisp-symlink-asdf $i/cl-smoke.$i
	done
	if use doc ; then
		cd ${S}/doc
		dodoc manual.html index.html
	fi
}
