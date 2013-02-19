EAPI=2

PYTHON_DEPEND="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="MultiVariate Pattern Analysis (MVPA) in Python"
HOMEPAGE="http://www.pymvpa.org/"
SRC_URI="https://github.com/PyMVPA/PyMVPA/archive/upstream/${PV}.tar.gz"

S="${WORKDIR}/PyMVPA-upstream-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc examples minimal test"

DEPEND="
		dev-lang/swig
		dev-python/lxml
		dev-python/numpy
		dev-python/nose
		dev-python/pywavelets
		sys-apps/help2man
		doc? ( dev-python/sphinx media-gfx/graphviz )
		test? ( dev-python/nose )
		sci-neuro/nibabel"

# TODO tutorial data

RDEPEND="dev-python/numpy
		 dev-python/hcluster
		 dev-python/matplotlib
		 dev-python/rpy
		 sci-fmri/afni
		 sci-fmri/fsl
		 sci-libs/libsvm
		 sci-libs/scipy
		 sci-libs/shogun[python]"
