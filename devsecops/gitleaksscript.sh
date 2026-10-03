#!/bin/bash

set -e

VERSION="8.30.1"
FILE="gitleaks_${VERSION}_linux_x64.tar.gz"
URL="https://github.com/gitleaks/gitleaks/releases/download/v${VERSION}/${FILE}"

echo "Installing Gitleaks ${VERSION}..."

cd /tmp

wget "${URL}"

tar -xzf "${FILE}"

mv gitleaks /usr/local/bin/gitleaks

chmod +x /usr/local/bin/gitleaks

rm -f "${FILE}"

echo "Gitleaks installation completed."

echo "Gitleaks version:"
gitleaks version

echo "Gitleaks location:"
which gitleaks
