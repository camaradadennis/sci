# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="Astropy affilated package for region handling"
HOMEPAGE="https://github.com/astropy/regions"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# TODO: fix this
# E   ModuleNotFoundError: No module named 'regions._geometry.circular_overlap'
RESTRICT="test"

RDEPEND="
	>=dev-python/astropy-0.4[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"

# TODO: fix this
# NameError: name 'disabled_intersphinx_mapping' is not defined
#distutils_enable_sphinx docs dev-python/sphinx-astropy
distutils_enable_tests pytest
