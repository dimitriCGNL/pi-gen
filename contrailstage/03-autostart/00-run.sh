#!/bin/bash

set -e

install -m 755 "./files/autostart.sh" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/autostart.sh"

on_chroot << EOF
    CRON_COMMAND="@reboot /home/${FIRST_USER_NAME}/autostart.sh"
    (crontab -u ${FIRST_USER_NAME} -l ; echo "$CRON_COMMAND") | crontab -u ${FIRST_USER_NAME} -
EOF