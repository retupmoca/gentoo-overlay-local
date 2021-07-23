# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2

EAPI=7

CRATES="
	addr2line-0.15.2
	adler-1.0.2
	aho-corasick-0.7.18
	ansi_term-0.11.0
	arrayref-0.3.6
	arrayvec-0.5.2
	assert_cmd-0.11.1
	atty-0.2.14
	autocfg-0.1.7
	autocfg-1.0.1
	backtrace-0.3.60
	base64-0.10.1
	base64-0.13.0
	binary-install-0.0.2
	bitflags-1.2.1
	blake2b_simd-0.5.11
	byteorder-1.4.3
	bytes-0.4.12
	bzip2-0.4.3
	bzip2-sys-0.1.11+1.0.8
	cargo_metadata-0.8.2
	cc-1.0.68
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	clap-2.33.3
	clicolors-control-0.2.0
	cloudabi-0.0.3
	console-0.6.2
	console-0.14.1
	constant_time_eq-0.1.5
	cookie-0.12.0
	cookie_store-0.7.0
	core-foundation-0.9.1
	core-foundation-sys-0.8.2
	crc32fast-1.2.1
	crossbeam-deque-0.7.3
	crossbeam-epoch-0.8.2
	crossbeam-queue-0.2.3
	crossbeam-utils-0.7.2
	crossbeam-utils-0.8.5
	curl-0.4.38
	curl-sys-0.4.44+curl-7.77.0
	dialoguer-0.3.0
	difference-2.0.0
	dirs-1.0.5
	dtoa-0.4.8
	either-1.6.1
	encode_unicode-0.3.6
	encoding_rs-0.8.28
	env_logger-0.5.13
	escargot-0.4.0
	failure-0.1.8
	failure_derive-0.1.8
	filetime-0.2.14
	flate2-1.0.20
	float-cmp-0.8.0
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	fuchsia-cprng-0.1.1
	fuchsia-zircon-0.3.3
	fuchsia-zircon-sys-0.3.3
	futures-0.1.31
	futures-cpupool-0.1.8
	getrandom-0.1.16
	getrandom-0.2.3
	gimli-0.24.0
	glob-0.2.11
	h2-0.1.26
	hashbrown-0.11.2
	heck-0.3.3
	hermit-abi-0.1.19
	hex-0.3.2
	http-0.1.21
	http-body-0.1.0
	httparse-1.4.1
	human-panic-1.0.3
	humantime-1.3.0
	hyper-0.12.36
	hyper-tls-0.3.2
	idna-0.1.5
	idna-0.2.3
	indexmap-1.7.0
	instant-0.1.9
	iovec-0.1.4
	is_executable-0.1.2
	itoa-0.4.7
	kernel32-sys-0.2.2
	lazy_static-0.2.11
	lazy_static-1.4.0
	libc-0.2.97
	libz-sys-1.1.3
	lock_api-0.1.5
	lock_api-0.3.4
	lock_api-0.4.4
	log-0.4.14
	matches-0.1.8
	maybe-uninit-2.0.0
	memchr-2.4.0
	memoffset-0.5.6
	mime-0.3.16
	mime_guess-2.0.3
	miniz_oxide-0.4.4
	mio-0.6.23
	miow-0.2.2
	native-tls-0.2.7
	net2-0.2.37
	normalize-line-endings-0.3.0
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.0
	object-0.25.3
	once_cell-1.8.0
	openssl-0.10.35
	openssl-probe-0.1.4
	openssl-src-111.15.0+1.1.1k
	openssl-sys-0.9.65
	os_type-2.3.0
	owning_ref-0.4.1
	parking_lot-0.6.4
	parking_lot-0.9.0
	parking_lot-0.11.1
	parking_lot_core-0.3.1
	parking_lot_core-0.6.2
	parking_lot_core-0.8.3
	percent-encoding-1.0.1
	percent-encoding-2.1.0
	pkg-config-0.3.19
	ppv-lite86-0.2.10
	predicates-1.0.8
	predicates-core-1.0.2
	predicates-tree-1.0.2
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-0.4.30
	proc-macro2-1.0.27
	publicsuffix-1.5.6
	quick-error-1.2.3
	quote-0.6.13
	quote-1.0.9
	rand-0.3.23
	rand-0.4.6
	rand-0.5.6
	rand-0.6.5
	rand-0.8.4
	rand_chacha-0.1.1
	rand_chacha-0.3.1
	rand_core-0.3.1
	rand_core-0.4.2
	rand_core-0.6.3
	rand_hc-0.1.0
	rand_hc-0.3.1
	rand_isaac-0.1.1
	rand_jitter-0.1.4
	rand_os-0.1.3
	rand_pcg-0.1.2
	rand_xorshift-0.1.1
	rdrand-0.4.0
	redox_syscall-0.1.57
	redox_syscall-0.2.9
	redox_users-0.3.5
	regex-1.5.4
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	reqwest-0.9.24
	rust-argon2-0.8.3
	rustc-demangle-0.1.20
	rustc_version-0.2.3
	ryu-1.0.5
	same-file-1.0.6
	schannel-0.1.19
	scopeguard-0.3.3
	scopeguard-1.1.0
	security-framework-2.3.1
	security-framework-sys-2.3.0
	semver-0.9.0
	semver-parser-0.7.0
	serde-1.0.126
	serde_derive-1.0.126
	serde_ignored-0.0.4
	serde_json-1.0.64
	serde_urlencoded-0.5.5
	serial_test-0.2.0
	serial_test_derive-0.2.0
	siphasher-0.2.3
	slab-0.4.3
	smallvec-0.6.14
	smallvec-1.6.1
	socket2-0.4.0
	stable_deref_trait-1.2.0
	string-0.2.1
	strsim-0.8.0
	structopt-0.3.21
	structopt-derive-0.4.14
	syn-0.15.44
	syn-1.0.73
	synstructure-0.12.4
	tar-0.4.35
	tempfile-2.2.0
	tempfile-3.2.0
	termcolor-1.1.2
	terminal_size-0.1.17
	termios-0.3.3
	textwrap-0.11.0
	thiserror-1.0.25
	thiserror-impl-1.0.25
	time-0.1.43
	tinyvec-1.2.0
	tinyvec_macros-0.1.0
	tokio-0.1.22
	tokio-buf-0.1.1
	tokio-current-thread-0.1.7
	tokio-executor-0.1.10
	tokio-io-0.1.13
	tokio-reactor-0.1.12
	tokio-sync-0.1.8
	tokio-tcp-0.1.4
	tokio-threadpool-0.1.18
	tokio-timer-0.2.13
	toml-0.4.10
	toml-0.5.8
	treeline-0.1.0
	try-lock-0.2.3
	try_from-0.3.2
	unicase-2.6.0
	unicode-bidi-0.3.5
	unicode-normalization-0.1.19
	unicode-segmentation-1.7.1
	unicode-width-0.1.8
	unicode-xid-0.1.0
	unicode-xid-0.2.2
	url-1.7.2
	url-2.2.2
	uuid-0.7.4
	uuid-0.8.2
	vcpkg-0.2.15
	vec_map-0.8.2
	version_check-0.9.3
	walkdir-2.3.2
	want-0.2.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.2+wasi-snapshot-preview1
	which-2.0.1
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	winreg-0.6.2
	ws2_32-sys-0.2.1
	xattr-0.2.2
	zip-0.5.13
"

inherit cargo

DESCRIPTION="📦✨ your favorite rust -> wasm workflow tool!"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/rustwasm/wasm-pack.git"
SRC_URI="https://github.com/rustwasm/wasm-pack/archive/refs/tags/v${PV}.tar.gz $(cargo_crate_uris ${CRATES})"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
#LICENSE="0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-2-Clause BSD-3-Clause BSL-1.0 CC0-1.0 ISC MIT Unlicense Zlib"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
