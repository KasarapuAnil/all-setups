#!/bin/bash

# Exit if any command fails
set -e

# Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins repository key
sudo rpm --import \
    https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Update system packages
sudo dnf upgrade -y

# Install Java 21 and Jenkins
sudo dnf install -y java-21-amazon-corretto jenkins

# Check Java version
java -version

# Reload systemd configuration
sudo systemctl daemon-reload

# Enable Jenkins at boot
sudo systemctl enable jenkins

# Start Jenkins
sudo systemctl start jenkins

# Check Jenkins status
sudo systemctl status jenkins --no-pager
