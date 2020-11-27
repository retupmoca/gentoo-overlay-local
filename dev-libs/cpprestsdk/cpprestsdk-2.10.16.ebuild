# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/microsoft/cpprestsdk/archive/v${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-util/cmake dev-cpp/websocketpp ${RDEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${WORKDIR}/${P}"

src_prepare(){
	cmake-utils_src_prepare
}

src_configure(){
	cmake-utils_src_configure
}

src_compile(){
	cmake-utils_src_compile
}

src_install(){
	cmake-utils_src_install
}
