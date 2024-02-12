#!/bin/bash -e

install -m 755 "./files/autostart.sh" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/autostart.sh"

on_chroot << EOF
    # Define the user and the script to run
    USER=contrailpi
    SCRIPT_PATH="/home/${FIRST_USER_NAME}/autostart.sh"

    # Create a temporary file to hold the new crontab entries
    TEMP_CRONTAB=$(mktemp)

    # Add the cron entry for the script
    echo "@reboot $SCRIPT_PATH" >> "$TEMP_CRONTAB"

    # Install the new crontab file for the specified user
    crontab -u "$USER" "$TEMP_CRONTAB"

    # Clean up the temporary file
    rm "$TEMP_CRONTAB"

    echo "Crontab updated for user $USER to run $SCRIPT_PATH on every reboot."
EOF
