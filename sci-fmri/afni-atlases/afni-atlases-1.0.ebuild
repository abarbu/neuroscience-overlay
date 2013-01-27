# Copyright 2013 Andrei Barbu, Purdue University
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

DESCRIPTION="Analysis of Functional NeuroImages (AFNI) atlases"
HOMEPAGE="http://afni.nimh.nih.gov/afni/"
SRC_NAME="atlases_latest"
SRC_URI="http://afni.nimh.nih.gov/pub/dist/tgz/atlases_latest.tgz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sci-fmri/afni"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/afni/atlases/
	doins *
	cat > 99afni-atlases <<EOF
AFNI_PLUGINPATH=${AFNI_PLUGINPATH}:/usr/share/afni/atlases/
EOF
	doenvd 99afni-atlases
	elog "Source /etc/profile before the atlases are available"
}
