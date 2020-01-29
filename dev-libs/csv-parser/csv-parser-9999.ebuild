# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
inherit git-r3
EGIT_REPO_URI="https://github.com/vincentlaucsb/csv-parser"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	echo "No compile."
}

src_install() {
	insinto /usr/include
	doins single_include/csv.hpp
}
