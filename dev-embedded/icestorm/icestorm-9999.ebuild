# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
inherit git-r3
EGIT_REPO_URI="https://github.com/cliffordwolf/icestorm"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user

	sed -i -e 's/PREFIX ?= \/usr\/local/PREFIX = \/usr/' config.mk || die
}
