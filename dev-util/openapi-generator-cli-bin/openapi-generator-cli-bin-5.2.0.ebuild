# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OpenAPI generator CLI"
HOMEPAGE="https://github.com/OpenAPITools/openapi-generator"
SRC_URI="https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${PV}/openapi-generator-cli-${PV}.jar"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	cp -v ${DISTDIR}/${A} ${WORKDIR}
	cat >${WORKDIR}/openapi-generator-cli <<END
#!/bin/sh
java -ea -Xms512M -Xmx8G -jar /opt/openapi-generator-cli-bin/openapi-generator-cli-${PV}.jar "\$@"
END
	chmod +x ${WORKDIR}/openapi-generator-cli
}

src_install() {
	insinto /opt/openapi-generator-cli-bin
	doins openapi-generator-cli-${PV}.jar
	insinto /usr/bin
	dobin openapi-generator-cli
}
