# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems

DESCRIPTION="Ruby wrappers of ncurses"
HOMEPAGE="http://ncurses-ruby.berlios.de/"
#SRC_URI="http://rubygems.org/downloads/ncurses-0.9.1.gem"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=sys-libs/ncurses-5.3"
RDEPEND="${DEPEND}"

