# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_NAME=breeze
inherit ecm plasma.kde.org

DESCRIPTION="Breeze cursor theme from the Plasma desktop"
HOMEPAGE="https://invent.kde.org/plasma/breeze"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS="amd64 arm64 ~loong ppc64 ~riscv ~x86"

# kde-frameworks/kwindowsystem[X]: Unconditional use of KX11Extras
RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	>=kde-frameworks/kcmutils-${KFMIN}:6
"
PDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_QT6=OFF
		-DBUILD_QT5=OFF
	)
	ecm_src_configure
}
