#!/bin/bash -e

install -m 755 "./files/autostart.sh" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/autostart.sh"

on_chroot << EOF
    SCRIPT_PATH="/home/${FIRST_USER_NAME}/autostart.sh"

    # Add the line to run the shell script before "exit 0" in rc.local
    sed -i "/^exit 0/i $SCRIPT_PATH" /etc/rc.local
EOF