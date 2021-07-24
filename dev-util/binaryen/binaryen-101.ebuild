# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="C generation of Eve Online's ESI API"
HOMEPAGE=""
SRC_URI="https://github.com/WebAssembly/binaryen/archive/refs/tags/version_${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-util/cmake ${RDEPEND}"
BDEPEND=""
CMAKE_USE_DIR="${WORKDIR}"
S="${WORKDIR}"

src_unpack(){
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi

	mv ${WORKDIR}/binaryen-version_${PV}/* ${WORKDIR}
	rmdir ${WORKDIR}/binaryen-version_${PV}
}

src_prepare(){
	cmake-utils_src_prepare
}

src_configure(){
	local mycmakeargs=(
		"-DENABLE_WERROR=OFF"
	)

	cmake-utils_src_configure
}

src_compile(){
	cmake-utils_src_compile
}

src_install(){
	cmake-utils_src_install
}
