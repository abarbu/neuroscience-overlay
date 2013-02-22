EAPI=2

PYTHON_DEPEND="2"
PYTHON_ABIS="2.*"
RESTRICT_PYTHON_ABIS="3.*"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Workflows and interfaces for neuroimaging packages"
HOMEPAGE="http://nipy.org/nipype"
SRC_URI="https://github.com/nipy/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python
        dev-python/networkx
        dev-python/traits"
RDEPEND="dev-lang/python
        dev-python/networkx
        dev-python/traits"
