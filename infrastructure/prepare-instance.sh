#!/bin/sh
set -e

sudo apt update
sudo apt upgrade -y

# install nodejs repo
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt install nodejs curl -y

git clone https://github.com/A-RR3/book-management-app.git app
cd app && npm install
tsc
sudo mv ./infrastructure/ubuntuapp.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable app.service


sudo reboot
