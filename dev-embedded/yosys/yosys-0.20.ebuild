# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/YosysHQ/yosys/archive/yosys-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} dev-lang/tcl dev-embedded/berkeley-abc"
BDEPEND=""

src_unpack() {
	default
	mv "yosys-yosys-${PV}" "yosys-${PV}"
}

src_prepare() {
	eapply_user

	sed -i -e 's/^ABCEXTERNAL ?=/ABCEXTERNAL = \/usr\/bin\/abc/' Makefile
	sed -i -e 's/^PREFIX ?= \/usr\/local/PREFIX = \/usr/' Makefile
}
