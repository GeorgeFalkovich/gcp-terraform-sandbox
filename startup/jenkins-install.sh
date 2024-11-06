#!/bin/bash

# Script to install Jenkins on Ubuntu 20.04

# Update the system
sudo apt update -y
sudo apt upgrade -y

# Install Java (Jenkins requires Java to run)
sudo apt install openjdk-17-jdk -y
sudo apt install openjdk-17-jdk -y

# Add the Jenkins repository
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list with Jenkins repository
sudo apt update -y

# Install Jenkins
sudo apt install jenkins -y

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Display the status of Jenkins service
sudo systemctl status jenkins

# Output the initial admin password for Jenkins
echo "Jenkins installed successfully!"
echo "To unlock Jenkins, use the following admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Jenkins is running on port 8080. Open http://your_server_ip_or_domain:8080 in your browser."