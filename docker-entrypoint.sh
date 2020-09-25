#!/bin/bash
set -e

chmod 600 /etc/wireguard/*.conf

if [ ! -f "/etc/wireguard/${WG_SERVER}.conf" ]; then
  echo "ERROR: file /etc/wireguard/${WG_SERVER}.conf not found!"
  exit 1
fi

./init
