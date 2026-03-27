#!/bin/bash
set -e

# Update and upgrade the system
apt-get update -y
apt-get upgrade -y

# Install required packages
apt-get install -y \
  docker.io \
  python3 \
  python3-pip \
  apache2-utils \
  iperf3 \
  git \
  ftp \
  vsftpd \
  redis-tools

# Enable Docker service
systemctl enable docker
systemctl start docker

echo "Versions of installed tools:"
docker --version
python3 --version
pip3 --version
ab -V || true
iperf3 --version
git --version
ftp --version
redis-cli --version

echo "Startup script completed successfully."
