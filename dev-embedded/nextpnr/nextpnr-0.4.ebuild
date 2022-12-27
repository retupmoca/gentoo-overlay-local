# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/YosysHQ/nextpnr/archive/refs/tags/nextpnr-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-util/cmake"
RDEPEND=""
BDEPEND=""

CMAKE_USE_DIR="${WORKDIR}/nextpnr-nextpnr-${PV}"
S="${WORKDIR}/nextpnr-nextpnr-${PV}"

src_prepare(){
	cmake_src_prepare
}

src_configure(){
	local mycmakeargs=(
		"-DARCH=ice40"
		"-DICEBOX_ROOT=/usr/share/icebox"
	)

	cmake_src_configure
}

src_compile(){
	cmake_src_compile
}

src_install(){
	cmake_src_install
}
