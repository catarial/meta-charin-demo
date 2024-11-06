FILESEXTRAPATHS:prepend := "${THISDIR}/files:"


SRC_URI += " \
    file://config-charin.yaml \
"

FILES:${PN} += " \
    ${sysconfdir}/everest/config-charin.yaml \
"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/config-charin.yaml ${D}${sysconfdir}/everest
}

