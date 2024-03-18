#!/bin/bash

set -e

on_chroot << EOF
    echo "Increasing swap memory to 1GB..."

    sed -i '/CONF_SWAPSIZE/d' /etc/dphys-swapfile
    echo "CONF_SWAPSIZE=1024" >> /etc/dphys-swapfile

    systemctl restart dphys-swapfile
EOF