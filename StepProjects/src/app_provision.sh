#!/bin/bash

# Update and install dependencies
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk git maven

# Add a non-root user to run the application
sudo useradd -m -s /bin/bash appuser

# Clone the PetClinic repository
sudo -u appuser git clone https://github.com/vashenko49/PetClinic.git /home/appuser/spring-petclinic


# Navigate to the project directory
cd /home/appuser/spring-petclinic

sudo -u appuser mvn package

export MYSQL_URL=jdbc:mysql://$DB_HOST:$DB_PORT/$DB_NAME
export MYSQL_USER=$DB_USER
export MYSQL_PASS=$DB_PASS

sudo -u appuser java -jar /home/appuser/spring-petclinic/target/*.jar