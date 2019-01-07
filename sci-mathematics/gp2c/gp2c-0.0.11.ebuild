EAPI=6

DESCRIPTION="Translator of GP routines to the C programming language (using the PARI library)"
HOMEPAGE="http://pari.math.u-bordeaux.fr/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="arm"
IUSE=""
SRC_URI="https://pari.math.u-bordeaux.fr/pub/pari/GP2C/${P}.tar.gz"

RDEPEND=""
DEPEND="${RDEPEND}
	sci-mathematics/pari"

src_configure() {
	# Find pari.cfg
	pari_cfg=$(find "${EPREFIX}"/usr/share/doc/pari-* -name pari.cfg | sort -r | head -n 1)

	econf --with-paricfg="${pari_cfg}"
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install
}
