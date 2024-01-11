#!/bin/bash
set -e

cp -r "./files/autostart.sh" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/autostart.sh"

chmod +x "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/autostart.sh"
