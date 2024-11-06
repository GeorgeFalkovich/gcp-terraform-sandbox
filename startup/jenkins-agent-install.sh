#!/bin/bash
# Script to install Jenkins on Ubuntu 20.04

# Update the system
sudo apt update -y
sudo apt upgrade -y

# Install Java (Jenkins requires Java to run)
sudo apt install openjdk-17-jdk -y

#!/bin/bash

# Update the package index
echo "Updating package index..."
sudo apt update -y

# install unzip
sudo apt install unzip -y

# install netstat
sudo apt install net-tools

# Install MySQL server
echo "Installing MySQL server..."
sudo apt install mysql-server -y

# Start MySQL service
echo "Starting MySQL service..."
sudo systemctl start mysql

# Enable MySQL to start on boot
echo "Enabling MySQL to start on boot..."
sudo systemctl enable mysql

# Run MySQL secure installation
echo "Running MySQL secure installation..."
sudo mysql_secure_installation <<EOF

y # Enable VALIDATE PASSWORD PLUGIN (choose "y" for Yes or "n" for No)
2 # Set password validation level (0 = Low, 1 = Medium, 2 = Strong)
root # Replace with your MySQL root password
root # Confirm the MySQL root password
y # Remove anonymous users
y # Disallow root login remotely
y # Remove test database and access to it
y # Reload privilege tables now
EOF

echo "MySQL installation and initial setup are complete."

# Add MySQL admin user with all privileges
echo "Creating MySQL admin user and granting privileges..."
sudo mysql -u root <<MYSQL_SCRIPT
CREATE USER 'admin_user'@'%' IDENTIFIED BY 'admin_password';
GRANT ALL PRIVILEGES ON *.* TO 'admin_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# Confirm MySQL status
echo "MySQL service status:"
sudo systemctl status mysql | grep Active

#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Apache2
echo "Installing Apache2..."
sudo apt install -y apache2

# Install PHP and required modules
echo "Installing PHP and required modules..."
sudo apt install -y php libapache2-mod-php php-mysql

# Restart Apache to apply changes
echo "Restarting Apache2..."
sudo systemctl restart apache2
sudo a2enmod rewrite
sudo a2enmod headers
sudo rm /var/www/html/index.html
sudo sed -i 's/^bind-address[[:space:]]*=[[:space:]]*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

sudo curl -sO http://jenkins.george-falkovich.com:8080/jnlpJars/agent.jar
sudo java -jar agent.jar -url http://jenkins.george-falkovich.com:8080/ -secret bb2c79d3666efcee39dd23b7baa3523f41868ba52a64fecab8f6ab06ede9305a -name "agent-1" -webSocket -workDir "/jenkins-agent/"

# Confirm installation
echo "Installation complete. Verifying versions..."


