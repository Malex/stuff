# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $ stumpwm-9999

EGIT_REPO_URI="git://git.savannah.nongnu.org/stumpwm.git"

EAPI=2
inherit common-lisp-2 common-lisp-3 glo-utils eutils elisp-common git autotools

DESCRIPTION="Stumpwm is a tiling, keyboard driven X11 Window Manager written entirely in Common Lisp."
HOMEPAGE="http://www.nongnu.org/stumpwm/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc sbcl clisp stumpish contrib source"

RESTRICT="strip"

RDEPEND="dev-lisp/cl-ppcre
		sbcl? ( >=dev-lisp/cl-clx-0.7.3-r1 )
		>=dev-lisp/cl-launch-2.11-r1
		!sbcl? ( !clisp? ( >=dev-lisp/sbcl-1.0.32 ) )
		!sbcl? ( clisp? ( >=dev-lisp/clisp-2.44[X,new-clx] ) )
		sbcl?  ( >=dev-lisp/sbcl-1.0.32 )"
		
DEPEND="${RDEPEND}
		sys-apps/texinfo
		doc? ( virtual/texi2dvi )"

src_prepare() {
	rm -rf .git
	cp "${FILESDIR}"/contrib/*.lisp contrib/
	mv contrib/notifications.lisp contrib/notification.lisp
	for i in "${FILESDIR}"/${PV}-*.patch ; do
		epatch $i
	done
	eautoreconf
}

src_configure() {
	ECONF_OPTS=--with-lisp=$(glo_best_flag sbcl clisp)
	if use contrib ; then
		ECONF_OPTS="${ECONF_OPTS} --with-contrib-dir=${CLSOURCEROOT}/${PN}/contrib" 
	fi
	if use clisp ; then
		ECONF_OPTS="${ECONF_OPTS} --with-ppcre=${CLSOURCEROOT}/cl-ppcre"
	fi
	echo "${ECONF_OPTS}"
	econf ${ECONF_OPTS}
}

src_compile() {
	addwrite /var/cache/cl-launch
	LISP_FASL_CACHE=/var/cache/cl-launch \
		cl-launch.sh \
		--lisp $(glo_best_flag sbcl clisp) \
		--wrap '
SBCL_OPTIONS="--noinform --userinit /dev/null"
CLISP_OPTIONS="-ansi -K full -norc --quiet"' \
		--path "${CLSOURCEROOT}/clx" \
		--path "${CLSOURCEROOT}/cl-ppcre" \
		--path-current \
		--system stumpwm --dump stumpwm.bin \
		|| die "Cannot create stumpwm binary"
	
	makeinfo ${PN}.texi || die "Cannot build info focs"
	if use doc ; then
		VARTEXFONTS="${T}"/fonts \
			texi2pdf ${PN}.texi || die "Cannot build PDF docs"
	fi
}

src_install() {
	common-lisp-export-impl-args $(glo_best_flag sbcl clisp)
	dobin stumpwm.bin
	if use sbcl; then
		CL_NORC="--noinform --disable-ldb --lose-on-corruption --no-sysinit --no-userinit --disable-debugger"
	fi
	make_wrapper stumpwm "/usr/bin/stumpwm.bin ${CL_NORC} ${CL_EVAL} '(stumpwm:stumpwm \":0\")'"
	make_session_desktop StumpWM /usr/bin/stumpwm

	cp "${FILESDIR}"/README.Gentoo . && sed -i "s:@VERSION@:${PV}:" README.Gentoo
	dodoc NEWS README README.Gentoo
	doinfo ${PN}.info
	use doc && dodoc ${PN}.pdf

	docinto examples ; dodoc sample-stumpwmrc.lisp

	if use stumpish; then
		dobin contrib/stumpish
	fi

	rm sample-stumpwmrc.lisp
	if use contrib; then
		common-lisp-install contrib/*.lisp
	fi
	if use source ; then
		common-lisp-install *.{lisp,asd}
		common-lisp-symlink-asdf
	fi
}
