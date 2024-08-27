# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils desktop xdg

DESCRIPTION="The 2048 game implemented in Qt"
HOMEPAGE="https://github.com/xiaoyong/2048-Qt"

if [[ ${PV} == *9999* ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/xiaoyong/2048-Qt.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/xiaoyong/2048-Qt/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~ppc64"
	S="${WORKDIR}/2048-Qt-${PV}"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-qt/qtcore-5.2.1:5
	dev-qt/qtdeclarative:5
	dev-qt/qtquickcontrols:5[widgets]
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/deployment.patch
)


src_configure() {
	local myqmakeargs=(
		PREFIX="${EPREFIX}/usr"
	)
	eqmake5 "${myqmakeargs[@]}"
}

src_install() {
	emake INSTALL_ROOT="${D}" install

	doicon res/icons/scalable/apps/${PN}.svg
	for size in 16 32 48 256
	do
		doicon -s $((size))x$((size)) res/icons/$((size))x$((size))/apps/${PN}.png
	done

	domenu res/${PN}.desktop
	doman res/man/${PN}.6
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
