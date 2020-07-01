# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker xdg-utils

DESCRIPTION="Digilent WaveForms"
HOMEPAGE="https://reference.digilentinc.com/reference/software/waveforms/waveforms-3/start"
SRC_URI="https://digilent.s3-us-west-2.amazonaws.com/Software/Waveforms2015/${PV}/digilent.waveforms_${PV}_amd64.deb"

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

src_prepare() {
	eapply_user

	sed -i -e 's/\/usr\/lib\//\/usr\/lib64\//g' usr/bin/waveforms
	sed -i -e 's/^\/usr/apulse \/usr/' usr/bin/waveforms
}

src_install() {
	insinto /usr/include
	doins -r usr/include/*

	insinto /usr/lib64
	doins -r usr/lib/*
	exeinto /usr/lib64/digilent/waveforms
	doexe usr/lib/digilent/waveforms/waveforms

	insinto /usr/share/applications
	doins -r usr/share/applications/*
	insinto /usr/share/digilent
	doins -r usr/share/digilent/*
	dodoc usr/share/doc/digilent.waveforms/*
	insinto /usr/share/lintian
	doins -r usr/share/lintian/*
	insinto /usr/share/man
	doins -r usr/share/man/*
	insinto /usr/share/mime
	doins -r usr/share/mime/*

	into /usr
	dobin usr/bin/*
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
