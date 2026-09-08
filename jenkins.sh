```bash
#!/bin/bash

# Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins repository key
sudo rpm --import \
    https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Update system packages
sudo dnf upgrade -y

# Install Java 21 and Jenkins
sudo dnf install java-21-amazon-corretto jenkins -y

# Select Java 21 as the default Java version
sudo alternatives --config java

# Reload systemd configuration
sudo systemctl daemon-reload

# Enable Jenkins to start automatically on boot
sudo systemctl enable jenkins

# Start Jenkins
sudo systemctl start jenkins

# Check Jenkins status
sudo systemctl status jenkins --no-pager
```
