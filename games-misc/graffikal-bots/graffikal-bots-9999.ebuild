# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Graphical frontend for bots"
HOMEPAGE="http://github.com/wentam/GraffikalBots"
inherit git-r3
EGIT_REPO_URI="https://github.com/wentam/GraffikalBots"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/libsdl2"
DEPEND="dev-util/cmake ${RDEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${WORKDIR}/${P}"

src_prepare(){
	cmake-utils_src_prepare
}

src_configure(){
	local mycmakeargs=(
		"-DLIB_DIR=$(get_libdir)"
	)

	cmake-utils_src_configure
}

src_compile(){
	cmake-utils_src_compile
}

src_install(){
	cmake-utils_src_install
}
