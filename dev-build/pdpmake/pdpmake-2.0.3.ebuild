# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Public domain implementation of make which follows the POSIX standard."
HOMEPAGE="http://frippery.org/make/"
SRC_URI="${HOMEPAGE}/${P}.tgz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~ppc64"
IUSE="extensions posix2024"

src_configure() {
	:
}

src_compile() {
	if use extensions
	then
		CFLAGS+=" -D ENABLE_FEATURE_MAKE_EXTENSIONS=1"
	fi
	if use posix2024
	then
		CFLAGS+=" -D ENABLE_FEATURE_MAKE_POSIX_2024=1"
	fi

	emake make
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install

	dodoc README.md LICENSE
}

src_test() {
	emake test
}
