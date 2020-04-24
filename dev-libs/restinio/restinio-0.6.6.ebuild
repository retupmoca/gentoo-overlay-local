# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/Stiffstream/restinio/releases/download/v.${PV}/restinio-${PV}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-util/cmake"
RDEPEND="dev-cpp/asio dev-libs/libfmt net-libs/http-parser"
BDEPEND=""

CMAKE_USE_DIR="${WORKDIR}/${P}/dev/restinio"

src_prepare(){
	cmake-utils_src_prepare
}

src_configure(){
	local mycmakeargs=(
		"-DRESTINIO_INSTALL=1"
		"-DRESTINIO_USE_EXTERNAL_HTTP_PARSER=1"
	)


	cmake-utils_src_configure
}

src_compile(){
	cmake-utils_src_compile
}

src_install(){
	cmake-utils_src_install
}

