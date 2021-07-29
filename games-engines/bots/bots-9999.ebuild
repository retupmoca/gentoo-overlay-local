# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2

EAPI=7

CRATES="
	bitflags-1.2.1
	bumpalo-3.7.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	lazy_static-1.4.0
	libc-0.2.98
	log-0.4.14
	memory_units-0.4.0
	proc-macro2-1.0.27
	quote-1.0.9
	syn-1.0.73
	unicode-xid-0.2.2
	wasm-bindgen-0.2.74
	wasm-bindgen-backend-0.2.74
	wasm-bindgen-macro-0.2.74
	wasm-bindgen-macro-support-0.2.74
	wasm-bindgen-shared-0.2.74
	wee_alloc-0.4.5
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="bots"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="homepage field in Cargo.toml inaccessible to cargo metadata"
SRC_URI="$(cargo_crate_uris ${CRATES})"
inherit git-r3
EGIT_REPO_URI="https://github.com/retupmoca/bots"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
#LICENSE="Apache-2.0 MIT MPL-2.0"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_unpack() {
	git-r3_fetch
	git-r3_checkout
	cargo_src_unpack
}

src_compile() {
	emake CFLAGS="${CFLAGS}" c_lib asm
}

src_install() {
	emake -j1 DESTDIR="${D}" LIBDIR="$(get_libdir)" PREFIX="/usr" install
}
