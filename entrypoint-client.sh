#!/bin/bash
set -e

echo "nameserver 10.10.0.10" > /etc/resolv.conf

exec "$@"
