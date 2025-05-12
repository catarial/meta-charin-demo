FILESEXTRAPATHS:prepend := "${THISDIR}/files:"


SRC_URI += " \
    file://esdp-iso15118.patch \
    file://comm_session_handler_enabledt.patch \
    file://ev_state_enabledt.patch \
    file://iso15118_2_states_enabledt.patch \
    file://simulator_enabledt.patch \
    file://power-curve.patch \
    file://enable_payment_method_in_python.patch \
"

RDEPENDS:${PN} += " \
    ${PYTHON_PN}-pyasn1 \
    ${PYTHON_PN}-hexdump \
"

