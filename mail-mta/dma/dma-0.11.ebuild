# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="The DragonFly Mail Agent, a small Mail Transport Agent (MTA), designed for home and office use."
HOMEPAGE="https://github.com/corecode/dma"
SRC_URI="https://github.com/corecode/dma/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 x86 arm64 mips"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}
	virtual/yacc
	sys-devel/flex"

src_configure() {
	true
}

src_compile() {
	emake PREFIX="${EPREFIX}/usr" || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" \
		install install-spool-dirs install-etc sendmail-link mailq-link

	keepdir /var/mail
	keepdir /var/spool/dma
}
