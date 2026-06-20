# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="QuickJS, the Next Generation: a mighty JavaScript engine"
HOMEPAGE="https://github.com/bellard/quickjs"
QJS_PV=${PV//./-}
QJS_PATCH=2
SRC_URI="https://bellard.org/quickjs/${PN}-${QJS_PV}${QJS_PATCH:+-${QJS_PATCH}}.tar.xz -> ${PN}-${QJS_PV}${QJS_PATCH:+-${QJS_PATCH}}.tar.xz"

S="${WORKDIR}/${PN}-${QJS_PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 ppc64"

IUSE="lto test"
RESTRICT="!test? ( test )"

src_configure() {
	if use lto
	then
		sed -i -e 's/^#*CONFIG_LTO=.*/CONFIG_LTO=yes/' Makefile
	fi

	sed -i -e 's;^PREFIX?\{0,1\}=.*;PREFIX=/usr;' Makefile
}
