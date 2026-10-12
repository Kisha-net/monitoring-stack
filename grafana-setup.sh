#!/bin/bash

# Grafana Enterprise Installation Script
# Standard paths: /etc/grafana (config), /var/lib/grafana (data)
# Version: 13.2.3

set -e


# Variables
GRAFANA_VERSION="13.2.3"
DEB_FILE="grafana-enterprise_${GRAFANA_VERSION}_36482603486_linux_amd64.deb"
DOWNLOAD_URL="https://dl.grafana.com/grafana-enterprise/release/${GRAFANA_VERSION}/${DEB_FILE}"
SERVICE="grafana-server"
WORK_DIR="$(mktemp -d)"

# Update system
#sudo apt update && sudo apt upgrade -y

# Install dependencies
sudo apt-get install -y adduser libfontconfig1 musl

# Download package
wget "${DOWNLOAD_URL}"

# Install package
sudo dpkg -i "${DEB_FILE}"

# Reload, enable, and start service
sudo systemctl daemon-reload
sudo systemctl enable "${SERVICE}"
sudo systemctl start "${SERVICE}"

echo "Grafana Enterprise installed successfully!"
echo " - Config: /etc/grafana/grafana.ini"
echo " - Data: /var/lib/grafana/"
echo " - Service: systemctl status ${SERVICE}"
echo "Access Grafana at: https://${SERVER_IP}:3000"
echo "Access Grafana UI at http://GrafanaIP:3000 (default admin/admin)"