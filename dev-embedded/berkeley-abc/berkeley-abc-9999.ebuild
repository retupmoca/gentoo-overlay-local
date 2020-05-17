# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
inherit git-r3
EGIT_REPO_URI="https://github.com/berkeley-abc/abc"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

#PATCHES=(
#	"${FILESDIR}"/${P}_add_missing_src.patch
#)

src_install() {
	dobin abc
}
