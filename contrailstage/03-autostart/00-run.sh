#!/bin/bash -e

install -m 755 "./files/autostart.sh" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/autostart.sh"
install -m 755 "./files/firstBoot.sh" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/firstBoot.sh"
install -m 755 "./files/autoUpdate.sh" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/autoUpdate.sh"
install -m 755 "./files/Contrail.service" "${ROOTFS_DIR}/etc/systemd/system/Contrail.service"