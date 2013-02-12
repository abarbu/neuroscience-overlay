EAPI=2

PYTHON_DEPEND="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="MultiVariate Pattern Analysis (MVPA) in Python"
HOMEPAGE="http://www.pymvpa.org/"
SRC_URI="https://github.com/nipy/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-lang/python"
