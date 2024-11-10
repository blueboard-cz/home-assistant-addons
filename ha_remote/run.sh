#!/usr/bin/bash

echo "Starting HA Remote Installer Addon"

echo "Installing Wireguard Client from the repository"
if ! ha addons list | grep -q "bigmoby/hassio-repository-addon"; then
  ha addons repository add https://github.com/bigmoby/hassio-repository-addon
fi
ha addons install bigmoby/wireguard-client

echo "Modifying HA configuration.yaml"
CONFIG_FILE="/config/configuration.yaml"
if ! grep -q "use_x_forwarded_for: true" $CONFIG_FILE; then
  echo -e "http:\n  use_x_forwarded_for: true\n  trusted_proxies:\n      - 178.251.187.18" >> $CONFIG_FILE
else
  echo "Configuration already contains the necessary changes."
fi

echo "Restarting Home Assistant"
ha core restart