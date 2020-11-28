# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="C++ generation of Eve Online's ESI API"
HOMEPAGE=""
SRC_URI="https://esi.evetech.net/latest/swagger.json -> ${P}.json"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/libsdl2"
DEPEND="dev-util/cmake dev-util/openapi-generator-cli-bin dev-libs/cpprestsdk ${RDEPEND}"
BDEPEND=""
CMAKE_USE_DIR="${WORKDIR}"
S="${WORKDIR}"

src_unpack() {
	openapi-generator-cli generate -i ${DISTDIR}/${A} --package-name esi-cpp -g cpp-restsdk --additional-properties=apiPackage=esi.api,modelPackage=esi.model -o ${WORKDIR}
	sed -i 's/CppRestOpenAPIClient/esi-cpp/' CMakeLists.txt
}

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
	insinto /usr/lib64
	doins lib/libesi-cpp.so
	insinto /usr/include/esi-cpp
	doins *.h
	sed -i 's/\.\.\/ApiClient\.h/ApiClient.h/' api/*.h
	doins api/*.h
	sed -i 's/\.\.\/ModelBase\.h/ModelBase.h/' model/*.h
	doins model/*.h
}
