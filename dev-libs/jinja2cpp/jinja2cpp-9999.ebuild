# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION=""
HOMEPAGE=""
inherit git-r3
EGIT_REPO_URI="https://github.com/jinja2cpp/Jinja2Cpp"
EGIT_SUBMODULES=( '*' '-thirdparty/boost' )

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-util/cmake ${RDEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${WORKDIR}/${P}"

src_prepare(){
	cmake-utils_src_prepare

	# don't install .a to a random subdir
	sed -i -e 's/\/static//' CMakeLists.txt
	# install shared too
	#sed -i -e 's/add_library(${LIB_TARGET_NAME} ${LIB_LINK_TYPE}/add_library(${LIB_TARGET_NAME} OBJECT/' CMakeLists.txt
	#sed -i -e 's/string(TOUPPER/add_library(jinja2cpp_static STATIC $<TARGET_OBJECTS:jinja2cpp>)\nadd_library(jinja2cpp_shared SHARED $<TARGET_OBJECTS:jinja2cpp>)\nSET_TARGET_PROPERTIES(jinja2cpp_static PROPERTIES OUTPUT_NAME jinja2cpp)\nSET_TARGET_PROPERTIES(jinja2cpp_shared PROPERTIES OUTPUT_NAME jinja2cpp)\nstring(TOUPPER/' CMakeLists.txt
	#sed -i -e '0,/    ${LIB_TARGET_NAME}/! s/    ${LIB_TARGET_NAME}/    jinja2cpp_shared\n        jinja2cpp_static/' CMakeLists.txt
	#sed -i -e 's/TARGET ${LIB_TARGET_NAME}/TARGET jinja2cpp_static/' CMakeLists.txt
}

src_configure(){
	local mycmakeargs=(
		"-DCMAKE_BUILD_TYPE=Release"
		"-DJINJA2CPP_DEPS_MODE=external-boost"
	)

	cmake-utils_src_configure
}

src_compile(){
	cmake-utils_src_compile
}

src_install(){
	cmake-utils_src_install
}
