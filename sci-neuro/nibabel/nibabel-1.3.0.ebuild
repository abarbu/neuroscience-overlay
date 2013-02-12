# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pywavelets/pywavelets-0.2.0.ebuild,v 1.1 2010/04/22 20:14:30 bicatali Exp $

EAPI=2

PYTHON_DEPEND="3"
SUPPORT_PYTHON_ABIS="1"
#RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="MultiVariate Pattern Analysis (MVPA) in Python"
HOMEPAGE="http://www.pymvpa.org/"
SRC_URI="https://github.com/nipy/${PN}/archive/${PV}.tar.gz"


#S="${WORKDIR}/${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-lang/python"
