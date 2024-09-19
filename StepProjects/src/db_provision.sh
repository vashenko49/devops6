#!/bin/bash
echo "$DB_NAME"
echo "$DB_PASS"
echo "$DB_PORT"

# Update and install MySQL
sudo apt-get update
sudo apt-get install -y mysql-server

# Configure MySQL to accept connections only from private network
sudo sed -i "s/bind-address.*/bind-address = 192.168.56.10/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "s/^port\s*=.*/port = $DB_PORT/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL to apply changes
sudo systemctl restart mysql

# Create database and user
mysql -u root -e "CREATE DATABASE $DB_NAME;"
mysql -u root -e "CREATE USER '$DB_USER'@'192.168.56.%' IDENTIFIED BY '$DB_PASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'192.168.56.%';"
mysql -u root -e "FLUSH PRIVILEGES;"
