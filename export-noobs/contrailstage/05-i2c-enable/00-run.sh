#!/bin/bash

set -e

on_chroot << EOF
    sudo raspi-config nonint do_i2c 0
EOF