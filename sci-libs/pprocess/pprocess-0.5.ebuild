EAPI=2

PYTHON_DEPEND="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="http://www.boddie.org.uk/python/pprocess.html"
HOMEPAGE=""
SRC_URI="http://www.boddie.org.uk/python/downloads/${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-lang/python"
