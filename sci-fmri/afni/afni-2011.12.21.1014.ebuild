# Copyright 2013 Andrei Barbu, Purdue University
# Distributed under the terms of the GNU General Public License v2

# TODO This install is messy

EAPI=4

inherit eutils versionator

DESCRIPTION="Analysis of Functional NeuroImages (AFNI) processing an displaying functional MRI data"
HOMEPAGE="http://afni.nimh.nih.gov/afni/"
SRC_NAME="AFNI_$(replace_all_version_separators '_')"
SRC_URI="http://afni.nimh.nih.gov/pub/dist/tgz/AFNI_ARCHIVE/${SRC_NAME}.tgz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

IUSE="R"

DEPEND="app-shells/tcsh
		x11-libs/libXp
		dev-libs/expat
		sci-libs/vtk
		x11-libs/motif
		sci-libs/gsl
		sys-libs/zlib
		virtual/glu
		net-misc/wget
		net-misc/python:2.7
		R? ( dev-lang/R )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${SRC_NAME}"

AFNI_DIR="${EPREFIX}/usr/$(get_libdir)/${PN}"

# TODO This does not replace all of AFNI's calls to gcc
src_configure() {
	use amd64 && \
		sed -i -e "s:/usr/bin/gcc -O2 -m64:$(tc-getCC) ${CFLAGS} ${LDFLAGS}:" \
			   -e "s:-L/usr/local/lib::" \
			   -e "s:-V 32::" \
			   -e "s:/usr/lib64/libexpat.a:-lexpat:" \
			   -e "s:# XLIBS = :XLIBS = :" Makefile.linux_xorg7_64 && \
		cp Makefile.linux_xorg7_64 Makefile
}

src_compile() {
	# parallelism doesn't seem to be safe
	make vastness -j1
}

src_install() {
	use amd64 && cd linux_xorg7_64 || die "package didn't install"
	for i in README*; do dodoc "${i}" && rm "${i}"; done
	dodoc afnigui.html && rm "${i}"
	exeinto ${AFNI_DIR}
	find . -type f ! -name "*.*" -exec doexe {} \; -exec rm {} \;
	find . -type f -name "*.py" -exec doexe {} \; -exec rm {} \;
	find . -type f -name "*.R" -exec doexe {} \; -exec rm {} \;
	find . -type f -name "*.so" -exec doexe {} \; -exec rm {} \;
	insinto ${AFNI_DIR}
	doins *
	cat > 99afni <<EOF
LDPATH=${AFNI_DIR}
PATH=${AFNI_DIR}
AFNI_PLUGINPATH=${AFNI_PLUGINPATH}:${AFNI_DIR}/plugins/
EOF
	doenvd 99afni
	elog "Copy ${AFNI_DIR}/AFNI.afnirc and ${AFNI_DIR}/AFNI.sumarc into ~/.afnirc and ~/.sumarc"
}
