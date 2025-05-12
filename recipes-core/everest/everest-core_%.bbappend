FILESEXTRAPATHS:prepend := "${THISDIR}/files:"


SRC_URI += " \
    file://config-charin.yaml \
    file://charger_info.yaml \
    file://enable_iso_dt.patch \
    file://composite_schedule_fixes.patch \
    file://switch_to_single_phase.patch \
    file://esdp.patch \
"

FILES:${PN} += " \
    ${sysconfdir}/everest/config-charin.yaml \
    ${sysconfdir}/everest/charger_info.yaml \
"

do_install:append() {
    install -m 0644 ${WORKDIR}/config-charin.yaml ${D}${sysconfdir}/everest
    install -m 0644 ${WORKDIR}/charger_info.yaml ${D}${sysconfdir}/everest
}

