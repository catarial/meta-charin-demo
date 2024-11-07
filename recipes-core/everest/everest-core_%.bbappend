FILESEXTRAPATHS:prepend := "${THISDIR}/files:"


SRC_URI += " \
    file://config-charin.yaml \
    file://charger_info.yaml \
    file://0001-rollback-uMWC-BSP-to-2024.6.0.patch \
"

FILES:${PN} += " \
    ${sysconfdir}/everest/config-charin.yaml \
    ${sysconfdir}/everest/charger_info.yaml \
"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/config-charin.yaml ${D}${sysconfdir}/everest
    install -m 0644 ${WORKDIR}/charger_info.yaml ${D}${sysconfdir}/everest
}

