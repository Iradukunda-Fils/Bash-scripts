#!/bin/bash

# Exit on error
set -e

echo "🔧 Updating package index..."
sudo apt update

echo "📦 Installing required packages..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "📁 Creating directory for Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "🔑 Downloading and adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "🔐 Setting permissions on GPG key..."
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📜 Adding Docker repository to APT sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index with Docker packages..."
sudo apt update

echo "🐳 Installing Docker Engine and related tools..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ Docker installation complete!"
docker --version
echo "running docker in the system"
sudo systemctl start docker

echo "enabling docker"
sudo systemctl enable docker
echo "you can cheque even the docker status (if running or not) using: sudo systemctl status docker"
