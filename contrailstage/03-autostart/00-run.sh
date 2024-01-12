#!/bin/bash -e

install -m 755 "./files/autostart.sh" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/autostart.sh"

SCRIPT_PATH="/home/${FIRST_USER_NAME}/autostart.sh"
# Escape special characters in the script path
ESCAPED_SCRIPT_PATH=$(echo "$SCRIPT_PATH" | sed 's/[\/&]/\\&/g')

# Add the line to run the shell script before "exit 0" in rc.local
sed -i "/^exit 0/i $ESCAPED_SCRIPT_PATH" "${ROOTFS_DIR}/etc/rc.local"
