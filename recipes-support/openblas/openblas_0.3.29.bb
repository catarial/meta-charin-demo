DESCRIPTION = "OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version."
HOMEPAGE = "http://www.openblas.net/"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=5adf4792c949a00013ce25d476a2abc0"

inherit siteinfo

RDEPENDS:${PN} += "libgomp"

SRCREV = "8795fc7985635de1ecf674b87e2008a15097ffab"
SRC_URI = "git://github.com/xianyi/OpenBLAS.git;protocol=https;branch=release-0.3.0"

S = "${WORKDIR}/git"

EXTRA_OEMAKE += " \
	FORCE_${OPENBLAS_TARGET}=1 \
	TARGET=${OPENBLAS_TARGET} \
	BINARY=${SITEINFO_BITS} \
	USE_OPENMP=1 \
	HOSTCC=${BUILD_CC} \
	CC=${CC} \
	PREFIX=${exec_prefix} \
	CROSS_SUFFIX=${HOST_PREFIX} \
	DESTDIR=${D} \
	"

do_compile() {
	oe_runmake libs shared
}

do_install() {
	oe_runmake install
	rmdir ${D}${bindir}
}

FILES:${PN}     = "${libdir}/*"
FILES:${PN}-dev = "${includedir} ${libdir}/lib${PN}.so ${libdir}/pkgconfig ${libdir}/cmake"

MACHINE_FEATURES:append = " highly-optimized"

BBCLASSEXTEND = "nativesdk"
