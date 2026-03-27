#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Siege
echo "Installing Siege"
sudo apt install siege -y

# Install Vegeta
echo "Installing Vegeta"
curl -L 'https://github.com/tsenart/vegeta/releases/download/v6.3.0/vegeta-v6.3.0-linux-386.tar.gz' -o vegeta.tar.gz
tar -xvzf vegeta.tar.gz
sudo mv vegeta /usr/local/bin/
rm vegeta.tar.gz

# Install Apache Benchmark (ab)
echo "Installing Apache Benchmark"
sudo apt install apache2-utils -y

# Install JMeter
echo "Installing JMeter"
# JMeter requires Java. Install OpenJDK 11
sudo apt install openjdk-11-jdk -y
# Download JMeter
JMETTER_VERSION="5.6.3" # Check current version at Apache JMeter Downloads site
wget "https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETTER_VERSION}.tgz"
tar -xvzf "apache-jmeter-${JMETTER_VERSION}.tgz"
sudo mv "apache-jmeter-${JMETTER_VERSION}" /opt/jmeter
# Add JMeter to PATH for convenience
echo 'export PATH=$PATH:/opt/jmeter/bin' | sudo tee /etc/profile.d/jmeter.sh
source /etc/profile.d/jmeter.sh # Apply immediately, though less critical for startup script

# Установка k6
echo "Installing k6"
# Добавляем GPG ключ k6
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E34A72
# Добавляем репозиторий k6
echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt update -y
sudo apt install k6 -y

# Install Locust (requires Python and pip)
echo "Installing Locust"
sudo apt install python3 python3-pip -y
pip3 install locust

# Install Artillery (requires Node.js and npm)
echo "Installing Artillery"
# Install Node.js 18.x (recommended version for Artillery)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
# Install Artillery globally
sudo npm install -g artillery

echo "All stress test tools installation complete."