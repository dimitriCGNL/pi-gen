#!/bin/bash -e

on_chroot << EOF
	cd "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/contrail-cameras/Raspberry_Pi/"
	pip install ".[complete]"
	npm install
EOF
