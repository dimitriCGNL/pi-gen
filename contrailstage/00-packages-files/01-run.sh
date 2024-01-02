#!/bin/bash

set -e

git clone -b Disable_ext_calibration --single-branch https://github.com/contrailcirrus/contrail-cameras.git
cd contrail-cameras
cp -r "Raspberry_Pi" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Raspberry_Pi_contrail"
