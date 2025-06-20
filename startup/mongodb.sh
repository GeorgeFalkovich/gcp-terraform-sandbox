#!/bin/bash
set -e

# Import MongoDB public GPG key
wget -qO - https://pgp.mongodb.com/server-6.0.asc | sudo apt-key add -

# Create the MongoDB source list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Update package database
sudo apt-get update

# Install MongoDB
sudo apt-get install -y mongodb-org

# Enable and start MongoDB
sudo systemctl enable mongod
sudo systemctl start mongod

# Print status
sudo systemctl status mongod --no-pager