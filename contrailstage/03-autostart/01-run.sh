#!/bin/bash

set -e

on_chroot << EOF
    systemctl daemon-reload
    systemctl enable Contrail.service
EOF
