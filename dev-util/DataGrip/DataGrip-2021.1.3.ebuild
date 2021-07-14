# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils linux-info versionator

DESCRIPTION="Many databases, one tool"
HOMEPAGE="https://www.jetbrains.com/datagrip"
SRC_URI="https://download.jetbrains.com/datagrip/${PN,,}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="JetBrainsToolbox"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="!custom-jdk? ( >=virtual/jdk-1.8:* )"

CONFIG_CHECK="~INOTIFY_USER"
IUSE="+custom-jdk"

QA_PREBUILT="opt/${PN}/*"

src_prepare() {
	if ! use amd64; then
		rm -r lib/libpty/linux/x86_64 || die
		rm -f bin/fsnotifier64 bin/libyjpagent-linux64.so bin/datagrip64.vmoptions || die
	fi
	if ! use x86; then
		#rm -r lib/libpty/linux/x86 || die
		#rm -f bin/fsnotifier bin/libyjpagent-linux.so bin/datagrip.vmoptions || die
		rm -f bin/fsnotifier bin/datagrip.vmoptions || die
	fi
	#rm -f bin/fsnotifier-arm || die
	rm Install-Linux-tar.txt || die

	if ! use custom-jdk; then
		rm -r jbr || die
	fi

	default
}

src_install() {
	local dir="/opt/${PN}"

	insinto "${dir}"
	doins -r *

	fperms +x "${dir}/bin/format.sh" "${dir}/bin/printenv.py" "${dir}/bin/restart.py" \
		"${dir}/bin/${PN,,}.sh"

	use amd64 && fperms +x "${dir}/bin/fsnotifier64"
	use x86 && fperms +x "${dir}/bin/fsnotifier"

	if use custom-jdk && use amd64; then
		for jrefile in java jjs keytool pack200 rmid rmiregistry unpack200; do
			fperms +x "${dir}/jbr/bin/${jrefile}"
		done
	fi

	doicon "bin/${PN,,}.png"
	newbin "${FILESDIR}/datagrip-launcher" datagrip

	#https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
	mkdir -p "${D}/etc/sysctl.d/"
	echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-${PN,,}-inotify-watches.conf"

	make_desktop_entry "${PN,,}" "${PN}" "${PN,,}" "Development;IDE"
}

pkg_postinst() {
	sysctl fs.inotify.max_user_watches=524288 >/dev/null
}
