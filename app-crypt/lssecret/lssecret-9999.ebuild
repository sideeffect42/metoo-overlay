# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="List all secret items using libsecret (e.g. GNOME Keyring)"
HOMEPAGE="https://gitlab.com/GrantMoyer/lssecret"

# Point to any required sources; these will be automatically downloaded by
# Portage.
EGIT_REPO_URI="https://gitlab.com/GrantMoyer/lssecret.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/lssecret"
S="${EGIT_CHECKOUT_DIR}"

LICENSE="public-domain"

SLOT="0"

KEYWORDS="arm64 ppc64"

IUSE=""

RDEPEND="app-crypt/libsecret"
BDEPEND="virtual/pkgconfig"

src_install() {
	emake DESTDIR="${D}/usr" install
}
