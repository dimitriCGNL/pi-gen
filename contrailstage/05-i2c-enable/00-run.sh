#!/bin/bash

set -e

on_chroot << EOF
    # Check if the script is run with root privileges
    if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Use 'sudo ./enable_i2c.sh'" 
    exit 1
    fi

    # Backup the original config.txt file
    cp /boot/config.txt /boot/config.txt.bak

    # Check if the I2C lines already exist in the config file
    if grep -q "^dtparam=i2c_arm=" /boot/config.txt; then
        echo "I2C is already enabled in /boot/config.txt"
    else
        # Enable I2C by appending the required lines to the end of the file
        echo -e "\n# Enable I2C" >> /boot/config.txt
        echo "dtparam=i2c_arm=on" >> /boot/config.txt
        echo "I2C enabled successfully. Reboot your Raspberry Pi to apply changes."
    fi
EOF