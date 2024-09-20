#!/bin/bash

sudo apt-get update
sudo apt-get install -y openjdk-11-jdk git maven

sudo useradd -m -s /bin/bash appuser

sudo -u appuser git clone https://github.com/vashenko49/PetClinic.git /home/appuser/spring-petclinic

cd /home/appuser/spring-petclinic

sudo -u appuser mvn package

sudo chmod 644  /home/appuser/spring-petclinic/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar

sudo tee /etc/systemd/system/petclinic.service > /dev/null <<EOF
[Unit]
Description=My Spring Boot Application
After=network.target

[Service]
User=appuser
ExecStart=/usr/bin/java -jar /home/appuser/spring-petclinic/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar --spring.profiles.active=mysql
Restart=always
WorkingDirectory=/home/appuser/spring-petclinic

Environment=PROFILE=mysql
Environment=MYSQL_URL=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}
Environment=MYSQL_PASS=${DB_PASS}
Environment=MYSQL_USER=${DB_USER}

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable petclinic.service
sudo systemctl start petclinic.service