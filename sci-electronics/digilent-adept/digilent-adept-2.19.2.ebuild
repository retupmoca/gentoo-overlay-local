# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker udev

DESCRIPTION="Digilent Adept library"
HOMEPAGE="https://s3-us-west-2.amazonaws.com/digilent/Software/Adept2+Runtime/2.19.2/digilent.adept.runtime_2.19.2-amd64.deb"
SRC_URI="https://s3-us-west-2.amazonaws.com/digilent/Software/Adept2+Runtime/${PV}/digilent.adept.runtime_${PV}-amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	insinto /usr/lib64
	doins -r usr/lib64/*

	insinto /usr/share/digilent
	doins -r usr/share/digilent/*
	insinto /usr/share/lintian
	doins -r usr/share/lintian/*

	dodoc -r usr/share/doc/digilent.adept.runtime/*

	into /usr
	dosbin usr/sbin/*

	insinto /etc
	doins etc/digilent-adept.conf
	insinto /etc/ld.so.conf.d
	doins etc/ld.so.conf.d/*
	udev_dorules etc/udev/rules.d/*
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
