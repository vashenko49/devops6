#!/bin/bash

sudo apt-get update
sudo apt-get install -y openjdk-17-jdk wget gnupg ca-certificates

wget http://ftp.kr.debian.org/debian/pool/main/i/init-system-helpers/init-system-helpers_1.60_all.deb

sudo apt install ./init-system-helpers_1.60_all.deb

sudo apt install ./docker-desktop-4.8.1-amd64.deb

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins
