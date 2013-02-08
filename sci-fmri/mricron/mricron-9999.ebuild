# Copyright 2013 Andrei Barbu, Purdue University
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

DESCRIPTION="MRIcron is a cross-platform NIfTI format image viewer"
HOMEPAGE="http://www.mccauslandcenter.sc.edu/mricro/mricron/"
SRC_NAME=""
SRC_URI="x86?   ( http://www.nitrc.org/frs/download.php/5158/lx32.zip )
		 amd64? ( http://www.nitrc.org/frs/download.php/5159/lx64.zip )"

#LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="$WORKDIR"

src_configure()
{
	true
}

src_compile()
{
	true
}

src_install()
{
	cd ${PN}
	exeinto /opt/bin/
	doexe dcm2nii
	doexe dcm2niigui
	doexe mricron
	doexe npm
}
