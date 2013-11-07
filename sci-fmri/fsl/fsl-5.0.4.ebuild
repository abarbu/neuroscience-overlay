# Copyright 2013 Andrei Barbu, Purdue University
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

DESCRIPTION="FSL is a comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data. This ebuild comes with all atlases and data."
HOMEPAGE="http://fsl.fmrib.ox.ac.uk"
SRC_URI="http://fsl.fmrib.ox.ac.uk/fsldownloads/${P}-sources.tar.gz"

LICENSE="free-noncomm" # close enough
SLOT=0
KEYWORDS="~x86 ~amd64"

DEPEND=">=dev-lang/tcl-8.4.18"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

FSL_DIR="${EPREFIX}/usr/$(get_libdir)/${PN}"

src_configure() {
	export FSLDIR="${S}"
	source "etc/fslconf/fsl.sh"
	use amd64 && ARCH=linux_64-gcc4.4
	use x86 && ARCH=linux_32-gcc4.1
	cp -r "config/${ARCH}" "config/${FSLMACHTYPE}"
	sed -i -e "s:CXX = c++:CXX = c++ -fpermissive:" \
		config/${FSLMACHTYPE}/systemvars.mk
	sed -i -e "s: > ./build.log 2>&1::" \
		-e "s:tail -10 build.log::" \
		build
}

src_compile() {
	touch build.log
	./build
        ./build
}

src_install() {
	cat > 99fsl <<-EOF
FSLDIR=${FSL_DIR}
PATH=${FSL_DIR}/bin
FSLOUTPUTTYPE=NIFTI_GZ
FSLMULTIFILEQUIT=TRUE
FSLTCLSH=${FSL_DIR}/bin/fsltclsh
FSLWISH=${FSL_DIR}/bin/fslwish
FSLCONFDIR=${FSL_DIR}/config
FSLMACHTYPE=`sh ${FSL_DIR}/etc/fslconf/fslmachtype.sh`
EOF
	doenvd 99fsl
	insinto ${FSL_DIR}
	doins -r config
	doins -r data
	doins -r etc
	doins -r include
	doins -r lib
	doins -r doc
	doins -r refdoc
	doins -r tcl
	insinto ${FSL_DIR}/extras
	doins -r extras/doc
	doins -r extras/include
	doins -r extras/lib
	doins -r extras/man
	doins -r extras/refdoc
	doins -r extras/share
	doins -r extras/tcl
	exeinto ${FSL_DIR}/bin/
	doexe bin/*
	exeinto ${FSL_DIR}/extras/bin/
	doexe extras/bin/*
}
