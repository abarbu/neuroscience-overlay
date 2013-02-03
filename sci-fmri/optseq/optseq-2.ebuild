# Copyright 2013 Andrei Barbu, Purdue University
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

DESCRIPTION="optseq2 is a tool for automatically scheduling events for rapid-presentation event-related (RPER) fMRI experiments"
HOMEPAGE="http://surfer.nmr.mgh.harvard.edu/optseq/"
SRC_NAME=""
SRC_URI="x86?   ( ftp://surfer.nmr.mgh.harvard.edu/pub/optseq/Linux/optseq2 )
		 amd64? ( ftp://surfer.nmr.mgh.harvard.edu/pub/optseq/Linux/x86_64/optseq2 )"

#LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="$WORKDIR"

src_unpack() {
	cp ${DISTDIR}/optseq2 ${WORKDIR}/
}

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
	exeinto /opt/bin/
	doexe optseq2
}
