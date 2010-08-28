# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit gems

MY_P="${P/ruby-/}"
DESCRIPTION="Ruby mail handling library."
HOMEPAGE="http://www.rfc20.org/rubymail/"
SRC_URI="http://gems.rubyforge.org/gems/${MY_P}.gem"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

USE_RUBY="ruby18"
