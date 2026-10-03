#!/bin/bash

set -e

echo "===================================="
echo " Installing Trivy"
echo "===================================="

# 1. Remove old repository if it exists
sudo rm -f /etc/yum.repos.d/trivy.repo

# 2. Create official Trivy repository
sudo tee /etc/yum.repos.d/trivy.repo > /dev/null <<'EOF'
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://aquasecurity.github.io/trivy-repo/rpm/public.key
EOF

echo "Trivy repository added."

# 3. Install Trivy
sudo dnf install -y trivy

# 4. Verify installation
echo ""
echo "===================================="
echo " Trivy version"
echo "===================================="

trivy --version

echo ""
echo "===================================="
echo " Trivy installation SUCCESS"
echo "===================================="