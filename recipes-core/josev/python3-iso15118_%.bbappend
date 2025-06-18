FILESEXTRAPATHS:prepend := "${THISDIR}/files:"


SRC_URI += " \
    file://esdp-iso15118.patch \
    file://enable_payment_method_in_python.patch \
"

RDEPENDS:${PN} += " \
    ${PYTHON_PN}-pyasn1 \
    ${PYTHON_PN}-hexdump \
"

