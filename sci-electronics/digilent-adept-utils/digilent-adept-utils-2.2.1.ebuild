# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker udev

DESCRIPTION="Digilent Adept library"
HOMEPAGE=""
SRC_URI="https://s3-us-west-2.amazonaws.com/digilent/Software/AdeptUtilities/${PV}/digilent.adept.utilities_${PV}-amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-electronics/digilent-adept"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	insinto /usr/share/digilent
	doins -r usr/share/digilent/*
	insinto /usr/share/man
	doins -r usr/share/man/*
	dodoc usr/share/doc/digilent.adept.utilities/*

	dobin usr/bin/*
}
