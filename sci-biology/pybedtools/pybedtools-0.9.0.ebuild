# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Use BED and GFF files from python using BEDtools"
HOMEPAGE="https://daler.github.io/pybedtools"
SRC_URI="https://github.com/daler/pybedtools/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	sci-biology/bedtools
	sci-biology/pysam[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
"

BDEPEND="dev-python/cython[${PYTHON_USEDEP}]"

# TODO: fix docs building
# ModuleNotFoundError: No module named 'pybedtools.cbedtools'
# even if pybedtools is installed
#distutils_enable_sphinx docs/source
distutils_enable_tests pytest

python_test() {
	# Requires network
	local EPYTEST_DESELECT=(
		test/test_helpers.py::test_chromsizes
	)
	cd "${T}" || die
	epytest --pyargs pybedtools
}
