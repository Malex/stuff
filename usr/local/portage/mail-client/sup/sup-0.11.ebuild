# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gems

DESCRIPTION="a console-based email client for people with a lot of email"
HOMEPAGE="http://sup.rubyforge.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-ruby/ruby-ferret-0.11.6
	dev-libs/xapian-bindings[ruby]
	dev-ruby/highline
	dev-ruby/lockfile
	>=dev-ruby/mime-types-1
	>=dev-ruby/ncurses-0.9.1
	dev-ruby/net-ssh
	dev-ruby/ruby-gettext
	>=dev-ruby/ruby-rmail-0.17
	>=dev-ruby/trollop-1.12
	dev-ruby/fastthread"
RDEPEND="${DEPEND}"
