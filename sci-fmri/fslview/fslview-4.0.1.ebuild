# Copyright 2013 Andrei Barbu, Purdue University
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils versionator cmake-utils

DESCRIPTION="FSLView is a comprehensive viewer for FMRI, MRI and DTI brain imaging data"
HOMEPAGE="http://fsl.fmrib.ox.ac.uk"
SRC_URI="http://neuro.debian.net/debian/pool/main/f/fslview/fslview_$(replace_version_separator _ '~').orig.tar.gz
		 http://fsl.fmrib.ox.ac.uk/fsldownloads/fsl-5.0.4-sources.tar.gz"

LICENSE="free-noncomm" # close enough
SLOT=0
KEYWORDS="~x86 ~amd64"

DEPEND="sci-fmri/fsl
		sci-libs/vtk
		dev-qt/qtgui
		x11-libs/qwt:5
                dev-qt/qthelp[compat]
		dev-qt/assistant"
RDEPEND="${DEPEND}"

S="${WORKDIR}/fslview-4.0.1"

src_prepare() {
	epatch "${FILESDIR}/bricon-widget.patch"
	epatch "${FILESDIR}/vtk.patch"
	cp -r ../fsl/extras/src/* fsl/ || die "couldn't copy extras"
	cp -r ../fsl/src/niftiio fsl/ || die "couldn't copy niftiio"
	cp -r ../fsl/src/znzlib fsl/ || die "couldn't copy znzlib"
}

src_configure() {
	local mycmakeargs=( -DQWT_INCLUDE_DIR=/usr/include/qwt5/
		-DFSL_DIR=${WORKDIR}/fsl/extras/include/ )
	cmake-utils_src_configure
}
