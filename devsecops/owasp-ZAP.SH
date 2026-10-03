cat > /root/install-zap.sh <<'EOF'
#!/bin/bash

set -e

echo "===================================="
echo "      OWASP ZAP INSTALLATION"
echo "===================================="

VERSION="2.17.0"
BASE_DIR="/opt/zap-install"
INSTALL_DIR="/opt/zap"

FILE="ZAP_${VERSION}_Linux.tar.gz"
URL="https://github.com/zaproxy/zaproxy/releases/download/v${VERSION}/${FILE}"

echo ""
echo "Checking Java..."
java --version

echo ""
echo "Checking disk space..."
df -h /

echo ""
echo "Creating installation directory..."
mkdir -p "$BASE_DIR"

echo ""
echo "Downloading ZAP..."
rm -f "$BASE_DIR/$FILE"

wget -O "$BASE_DIR/$FILE" "$URL"

echo ""
echo "Download completed:"
ls -lh "$BASE_DIR/$FILE"

echo ""
echo "Extracting ZAP..."
rm -rf "$BASE_DIR/ZAP_${VERSION}"

tar -xzf "$BASE_DIR/$FILE" -C "$BASE_DIR"

echo ""
echo "Installing ZAP..."
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

cp -r "$BASE_DIR/ZAP_${VERSION}/"* "$INSTALL_DIR/"

chmod +x "$INSTALL_DIR/zap.sh"

echo ""
echo "Creating command..."
ln -sf "$INSTALL_DIR/zap.sh" /usr/local/bin/zap.sh

echo ""
echo "Checking ZAP version..."
zap.sh -version

echo ""
echo "===================================="
echo "   ZAP INSTALLATION SUCCESS"
echo "===================================="
EOF

chmod +x /root/install-zap.sh












# //pipeline script
stage('owasp test'){
    steps{
        sh '''
        rm -rf zap-report
        mkdir -p "$WORKSPACE/zap-report"

        /opt/zap/zap.sh -cmd \
        -port 8090 \
        -quickurl http://localhost \
        -quickout zap-report/zap-report.html
        '''
    }
}