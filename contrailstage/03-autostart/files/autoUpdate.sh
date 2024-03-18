#!/bin/bash

sudo systemctl stop Contrail.service

cd /home/contrailpi/contrail-cameras

git pull

sudo cp -r /home/contrailpi/contrail-cameras/Raspberry_Pi /home/contrailpi/Raspberry_Pi_contrail

cd /home/contrailpi/Raspberry_Pi_contrail

sudo python3 -m pip install -U pip wheel --break-system-packages
sudo python3 -m pip install ".[complete]" --break-system-packages
sudo npm install

echo "Update complete"

sudo systemctl enable Contrail.service
sudo systemctl start Contrail.service