# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_NAME=breeze
KFMIN=6.22.0
QTMIN=6.10.1
inherit ecm plasma.kde.org xdg

DESCRIPTION="Breeze cursor theme from the Plasma desktop"
HOMEPAGE="https://invent.kde.org/plasma/breeze"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS="amd64 arm64 ~loong ppc64 ~riscv ~x86"
IUSE=""

RDEPEND="${DEPEND}
	!<${CATEGORY}/${PN}-6.5.0:5
"
BDEPEND=">=kde-frameworks/kcmutils-${KFMIN}:6"
PDEPEND=">=kde-frameworks/breeze-icons-${KFMIN}:*"

src_configure() {
	local mycmakeargs=(
		-DBUILD_QT6=OFF
		-DBUILD_QT5=OFF
	)
	ecm_src_configure
}
