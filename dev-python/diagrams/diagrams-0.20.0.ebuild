EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} pypy3  )
inherit distutils-r1

DESCRIPTION="Diagram as Code."
HOMEPAGE="https://diagrams.mingrammer.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

DISTUTILS_USE_SETUPTOOLS="pyproject.toml"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="${PYTHON_DEPS}
	dev-python/graphviz[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/build-system.patch
	"${FILESDIR}"/basedir.patch
)

src_prepare() {
	mv resources diagrams

	default
}
