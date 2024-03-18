#!/bin/bash -e

on_chroot << EOF
	cd "/home/${FIRST_USER_NAME}/Raspberry_Pi_contrail/"
	python -m pip install ".[complete]" --break-system-packages
	npm install
EOF
