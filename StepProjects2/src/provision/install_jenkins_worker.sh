#!/bin/bash

sudo apt-get update

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

sudo apt upgrade libc6

sudo apt install -y nodejs

sudo apt-get install -y openjdk-17-jdk nodejs npm

sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker vagrant


sudo adduser --group --home /home/jenkins --shell /bin/bash jenkins
