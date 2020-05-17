EAPI=7

DESCRIPTION="A tool intended for minimal docker containers"
HOMEPAGE="https://github.com/retupmoca/ldd-dep-cp"
inherit git-r3
EGIT_REPO_URI="https://github.com/retupmoca/ldd-dep-cp"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libfmt"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake -j1 DESTDIR="${D}" PREFIX="/usr" install
}
