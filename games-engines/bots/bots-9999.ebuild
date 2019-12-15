# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Attempted modern ATRobots engine"
HOMEPAGE="https://github.com/retupmoca/bots"
inherit git-r3
EGIT_REPO_URI="https://github.com/retupmoca/bots"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake -j1 DESTDIR="${D}" LIBDIR="$(get_libdir)" PREFIX="/usr" install
}
