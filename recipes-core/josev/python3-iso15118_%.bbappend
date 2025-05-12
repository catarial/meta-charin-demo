FILESEXTRAPATHS:prepend := "${THISDIR}/files:"


SRC_URI += " \
    file://esdp-iso15118.patch \
    file://comm_session_handler_enabledt.patch \
    file://ev_state_enabledt.patch \
"

RDEPENDS:${PN} += " \
    ${PYTHON_PN}-pyasn1 \
    ${PYTHON_PN}-hexdump \
"

