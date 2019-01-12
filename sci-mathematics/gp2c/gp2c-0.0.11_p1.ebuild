EAPI=6

MY_P=${P/_p/pl}
DESCRIPTION="Translator of GP routines to the C programming language (using the PARI library)"
HOMEPAGE="http://pari.math.u-bordeaux.fr/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="arm"
IUSE=""
SRC_URI="https://pari.math.u-bordeaux.fr/pub/pari/GP2C/${MY_P}.tar.gz"

RDEPEND=""
DEPEND="${RDEPEND}
	sci-mathematics/pari"

S="${WORKDIR}/${MY_P}"

src_configure() {
	# Find pari.cfg
	inst_pari_version=$(best_version sci-mathematics/pari)
	pari_cfg="${EPREFIX}/usr/share/doc/${inst_pari_version##*/}/pari.cfg"
	test -f "${pari_cfg}" || die "Could not find pari.cfg!"
	elog "Found PARI cfg: ${pari_cfg}"

	econf --with-paricfg="${pari_cfg}"
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install
}
